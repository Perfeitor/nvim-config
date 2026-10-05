local cmp = require('blink.cmp')

-- blink.cmp's fuzzy matcher is written in Rust and compiled with cargo.
-- Build only when cargo exists, otherwise fall back to the pure-Lua matcher
-- so machines without Rust never show a build error.
local has_cargo = vim.fn.executable('cargo') == 1
if has_cargo then
    cmp.build():pwait()
end

cmp.setup({
    -- Rust matcher when built, pure-Lua fallback otherwise.
    fuzzy = {
        implementation = has_cargo and 'prefer_rust' or 'lua',
    },

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
