local cmp = require('blink.cmp')

cmp.build():pwait()

cmp.setup({
    keymap = {
        preset = "default",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
    },

    completion = {
        list = {
            selection = {
                preselect = true,
                auto_insert = false,
            },
        },
        documentation = {
            auto_show = true,
        },
    },

    sources = {
        default = {
            "lazydev",
            "lsp",
            "path",
            "buffer",
        },
        providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
            },
        },
    },
})

vim.lsp.completion.enable(false)
