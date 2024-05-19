return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
        },
        opts = {
            ensure_installed = { "javascript", "typescript", "cpp", "python", "c", "lua", "rust" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true, disable = { "python" } },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                    selection_modes = {
                        ["@parameter.outer"] = "v",
                        ["@function.outer"] = "V",
                        ["@class.outer"] = "<c-v>",
                    },
                    include_surrounding_whitespace = true,
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                    },
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.install").update({ with_sync = true })
            require("nvim-treesitter.configs").setup(opts)
            vim.schedule(function()
                require("lazy").load({ plugins = { "nvim-treesitter-textobjects" } })
            end)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        lazy = true,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    }
}
