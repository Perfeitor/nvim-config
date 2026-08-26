require("lensline").setup({
    profiles = {
        {
            name = "default",
            providers = {
                {
                    name = "usages",
                    enabled = true,
                    include = { "refs", "impls" },
                },
                {
                    name = "last_author",
                    enabled = true,
                },
            },

            style = {
                separator = " ",
                prefix = "",
                placement = "above",
            },
        },
    },
})
