local cmp = require('blink.cmp')

cmp.build():pwait()

cmp.setup({
    keymap = {
        preset = "default",
    },

    completion = {
        documentation = {
            auto_show = true,
        },
    },

    sources = {
        default = {
            "lsp",
            "path",
            "buffer",
        },
    },
})

vim.lsp.completion.enable(false)
