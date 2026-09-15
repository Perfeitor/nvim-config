-- =============================================
--  LANGUAGE LOADER
--  Scan EVERY subdirectory in lua/langs/ and call require("langs.<name>").
--  Each directory = 1 language, with init.lua as the entry point.
--
--  Why is this design merge-conflict-free?
--  - Adding a language = ADDING 1 directory, never editing shared files.
--  - Git merge only conflicts when 2 branches edit the same lines of a file.
--    No branch edits this file -> merging n branches stays clean.
-- =============================================
local langs_dir = vim.fn.stdpath("config") .. "/lua/langs"

for _, entry in ipairs(vim.fn.glob(langs_dir .. "/*", false, true)) do
  if vim.fn.isdirectory(entry) == 1 then -- directories only
    local name = vim.fn.fnamemodify(entry, ":t")
    require("langs." .. name)
  end
end
