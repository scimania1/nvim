return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "williamboman/mason.nvim",
            "stevearc/conform.nvim",
        },
        config = function()
            require("user.configs.lsp").lspconfig.setup()
        end,
    },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                desc = "Format buffer",
            },
        },
        init = function()
            -- If you want the formatexpr, here is the place to set it
            vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
        end,
        config = function()
            require("user.configs.lsp").conform.setup()
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {},
        keys = {
            {
                "<leader>wd",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "shows diagnostics in trouble.nvim",
            },
        },
    },
}
