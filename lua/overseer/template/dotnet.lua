-- =============================================
--  C#: Overseer task templates (dotnet build/test/run/watch)
--  Auto-discovered by overseer from <runtimepath>/lua/overseer/template/.
--  Lives on the lang/csharp branch (language-specific); main stays generic.
--
--  `dotnet build` is also used as the nvim-dap `preLaunchTask` (see
--  lua/langs/csharp/dap.lua). The launch config is passed through
--  params[LAUNCH_CONFIG_KEY], so the task knows exactly which project
--  and build configuration the debug session asked for.
-- =============================================
local overseer = require("overseer")
local LAUNCH_CONFIG_KEY = require("overseer.vscode").LAUNCH_CONFIG_KEY

local function start_dir()
  local buf = vim.api.nvim_buf_get_name(0)
  return buf ~= "" and vim.fn.fnamemodify(buf, ":p:h") or vim.fn.getcwd()
end

local function find_up(pred)
  return vim.fs.find(pred, {
    path = start_dir(),
    upward = true,
    stop = vim.env.HOME,
    type = "file",
  })[1]
end

local function find_csproj()
  return find_up(function(name) return name:match("%.csproj$") ~= nil end)
end

local function find_sln()
  return find_up(function(name) return name:match("%.sln$") ~= nil end)
end

local function project_dir()
  local csproj = find_csproj()
  return csproj and vim.fn.fnamemodify(csproj, ":h") or vim.fn.getcwd()
end

-- Short-lived tasks (build/test): surface compiler errors in the quickfix.
local function short_lived()
  return {
    {
      "on_output_quickfix",
      open_on_exit = "failure",
      set_diagnostics = true,
      errorformat = "%f(%l\\,%c): %trror %m,%f(%l\\,%c): %twarning %m",
    },
    { "unique", soft = true },
    "default",
  }
end

-- Long-running tasks (run/watch): show the output while running.
local function long_lived()
  return {
    { "open_output", on_start = "always", focus = false },
    { "unique", soft = true },
    "default",
  }
end

local function build_task()
  return {
    name = "dotnet build",
    desc = "Build a .NET project (Debug/Release)",
    tags = { overseer.TAG.BUILD },
    builder = function(params)
      local launch = params[LAUNCH_CONFIG_KEY] or {}
      local b = launch._build or {}
      local dir = b.dir or project_dir()
      local config = b.config or "Debug"
      return {
        cmd = { "dotnet", "build", "-c", config, dir },
        cwd = dir,
        components = short_lived(),
      }
    end,
  }
end

local function test_task()
  return {
    name = "dotnet test",
    desc = "Run .NET tests (nearest solution or project)",
    tags = { overseer.TAG.TEST },
    builder = function()
      local target = find_sln() or find_csproj() or vim.fn.getcwd()
      return {
        cmd = { "dotnet", "test", target },
        cwd = vim.fn.fnamemodify(target, ":h"),
        components = short_lived(),
      }
    end,
  }
end

local function run_task()
  return {
    name = "dotnet run",
    desc = "Run the nearest .NET project",
    tags = { overseer.TAG.RUN },
    builder = function()
      local csproj = find_csproj()
      if not csproj then
        return { cmd = { "dotnet", "run" }, components = long_lived() }
      end
      return {
        cmd = { "dotnet", "run", "--project", csproj },
        cwd = vim.fn.fnamemodify(csproj, ":h"),
        components = long_lived(),
      }
    end,
  }
end

local function watch_task()
  return {
    name = "dotnet watch",
    desc = "dotnet watch run the nearest .NET project",
    tags = { overseer.TAG.RUN },
    builder = function()
      local csproj = find_csproj()
      if not csproj then
        return { cmd = { "dotnet", "watch", "run" }, components = long_lived() }
      end
      return {
        cmd = { "dotnet", "watch", "--project", csproj, "run" },
        cwd = vim.fn.fnamemodify(csproj, ":h"),
        components = long_lived(),
      }
    end,
  }
end

return {
  condition = { filetype = { "cs", "razor" } },
  generator = function()
    return { build_task(), test_task(), run_task(), watch_task() }
  end,
}
