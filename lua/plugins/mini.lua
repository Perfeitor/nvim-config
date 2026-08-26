require("mini.starter").setup({
  items = {
    {
      name = "Recent files",
      action = "lua MiniStarter.open()",
      section = "Recent",
    },
    require("mini.starter").sections.recent_files(10, true, true),
    require("mini.starter").sections.builtin_actions(),
  },
})
