return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        opts = {
            styles = {
                bold = true,
                italic = false,
                transparency = false,
            },
            highlight_groups = {
                TelescopeBorder = { fg = "overlay", bg = "overlay" },
                TelescopeNormal = { fg = "subtle", bg = "overlay" },
                TelescopeSelection = { fg = "text", bg = "highlight_med" },
                TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
                TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

                TelescopeTitle = { fg = "base", bg = "love" },
                TelescopePromptTitle = { fg = "base", bg = "pine" },
                TelescopePreviewTitle = { fg = "base", bg = "iris" },

                TelescopePromptNormal = { fg = "text", bg = "surface" },
                TelescopePromptBorder = { fg = "surface", bg = "surface" },
            },
        },
        config = function(_, opts)
            require("rose-pine").setup(opts)
            vim.cmd([[colorscheme rose-pine]])
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = {
            style = "night",
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
            },
            lualine_bold = true,
            on_highlights = function(hl, c)
                local prompt = "#2d3149"
                hl.TelescopeNormal = {
                    bg = c.bg_dark,
                    fg = c.fg_dark,
                }
                hl.TelescopeBorder = {
                    bg = c.bg_dark,
                    fg = c.bg_dark,
                }
                hl.TelescopePromptNormal = {
                    bg = prompt,
                }
                hl.TelescopePromptBorder = {
                    bg = prompt,
                    fg = prompt,
                }
                hl.TelescopePromptTitle = {
                    bg = c.red,
                    fg = c.bg_dark,
                }
                hl.TelescopePreviewTitle = {
                    bg = c.green,
                    fg = c.bg_dark,
                }
                hl.TelescopeResultsTitle = {
                    bg = c.blue,
                    fg = c.bg_dark,
                }
            end,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
}
