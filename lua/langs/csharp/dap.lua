-- =============================================
--  C#: Debug Adapter Protocol (netcoredbg)
--  Adapter + dynamic config provider for C#.
--  Shared infrastructure (signs, F5/F10/...) lives in
--  lua/plugins/dap.lua (main).
--  Remembers profile/build choice per project (session-only).
-- =============================================
local dap = require("dap")
local dap_ui = require("dap.ui")

-- Auto-install netcoredbg if missing (deferred until after mason.setup()).
vim.schedule(function()
  local ok, registry = pcall(require, "mason-registry")
  if ok and not registry.is_installed("netcoredbg") then
    registry.get_package("netcoredbg"):install()
  end
end)

dap.adapters.coreclr = {
  type = "executable",
  command = "netcoredbg",
  args = { "--interpreter=vscode" },
}

-- ===== Helpers =====
-- Find the project directory (nearest .csproj) for the current buffer.
local function project_dir(bufnr)
  local file = vim.api.nvim_buf_get_name(bufnr)
  local start = file ~= "" and vim.fn.fnamemodify(file, ":p:h") or vim.fn.getcwd()
  local csproj = vim.fs.find(function(name) return name:match("%.csproj$") ~= nil end,
    { path = start, upward = true, stop = vim.env.HOME })[1]
  return csproj and vim.fn.fnamemodify(csproj, ":h") or vim.fn.getcwd()
end

-- Read Properties/launchSettings.json -> map of profile name -> profile.
local function read_profiles(dir)
  local path = dir .. "/Properties/launchSettings.json"
  if vim.fn.filereadable(path) == 0 then return {} end
  local ok, data = pcall(vim.json.decode, table.concat(vim.fn.readfile(path), "\n"))
  if not ok or type(data) ~= "table" or type(data.profiles) ~= "table" then return {} end
  return data.profiles
end

-- Locate the assembly .dll for a given build configuration (Debug/Release).
local function find_dll(dir, build_config)
  local csproj = vim.fn.glob(dir .. "/*.csproj", false, true)[1]
  local name = csproj and vim.fn.fnamemodify(csproj, ":t:r") or vim.fn.fnamemodify(dir, ":t")
  return vim.fn.glob(dir .. "/bin/" .. build_config .. "/net*/" .. name .. ".dll", false, true)[1]
end

-- Map a launch profile to netcoredbg env (applicationUrl -> ASPNETCORE_URLS).
local function profile_env(profile)
  local env = vim.deepcopy(profile.environmentVariables or {})
  if profile.applicationUrl then env.ASPNETCORE_URLS = profile.applicationUrl end
  return env
end

-- ===== Selection memory (session-only) =====
local memory, force_pick = {}, false

local function build_config(dir, choice)
  local profile = choice.profile and read_profiles(dir)[choice.profile] or nil
  return {
    type = "coreclr",
    request = "launch",
    name = ("Launch [%s] (%s)"):format(choice.profile or "default", choice.config),
    cwd = (profile and profile.workingDirectory) or dir,
    env = profile and profile_env(profile) or {},
    args = (profile and profile.commandLineArgs) or {},
    program = function()
      vim.notify(("C#: building (%s)..."):format(choice.config), vim.log.levels.INFO)
      vim.fn.system({ "dotnet", "build", "-c", choice.config, dir })
      if vim.v.shell_error ~= 0 then
        vim.notify("C#: build failed", vim.log.levels.ERROR)
        return dap.ABORT
      end
      local dll = find_dll(dir, choice.config)
      if not dll then
        vim.notify(("C#: no .dll found in bin/%s/net*/"):format(choice.config), vim.log.levels.ERROR)
        return dap.ABORT
      end
      return dll
    end,
  }
end

local function abort_config()
  return { type = "coreclr", request = "launch", name = "abort", program = dap.ABORT }
end

-- ===== Dynamic config provider =====
dap.providers.configs["dap.csharp"] = function(bufnr)
  if vim.bo[bufnr].filetype ~= "cs" then return {} end
  local dir = project_dir(bufnr)

  local cfg = setmetatable({ name = "C# Launch" }, { __call = function()
    if memory[dir] and not force_pick then return build_config(dir, memory[dir]) end
    force_pick = false

    local profiles = read_profiles(dir)
    local names = {}
    for name, p in pairs(profiles) do
      if p.commandName == "Project" then names[#names + 1] = name end
    end
    table.sort(names)

    local profile_name = nil
    if #names > 0 then
      profile_name = dap_ui.pick_one(names, "Select profile: ")
      if not profile_name then return abort_config() end
    end

    local build_cfg = dap_ui.pick_one({ "Debug", "Release" }, "Select build configuration: ")
    if not build_cfg then return abort_config() end

    memory[dir] = { profile = profile_name, config = build_cfg }
    return build_config(dir, memory[dir])
  end })

  return { cfg }
end

-- ===== C#-specific keymaps =====
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cs", "razor" },
  callback = function()
    vim.keymap.set("n", "<leader>dP", function()
      force_pick = true
      require("dap").continue({ new = true })
    end, { buffer = true, desc = "C#: Re-select profile/build" })

    vim.keymap.set("n", "<leader>dA", function()
      require("dap").run({
        type = "coreclr",
        request = "attach",
        name = "Attach (netcoredbg)",
        processId = require("dap.utils").pick_process,
      })
    end, { buffer = true, desc = "C#: Attach process" })
  end,
})
