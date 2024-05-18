return {
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
            },
            keymaps = {
                ["<C-h>"] = false,
                ["<C-s>"] = false,
                ["<leader>os"] = "actions.select_split",
                ["<leader>ov"] = "actions.select_vsplit",
            },
        },
        config = function(_, opts)
            require("oil").setup(opts)
            vim.keymap.set("n", "<Tab>", "<cmd>Oil<cr>")
        end,
    }
}
