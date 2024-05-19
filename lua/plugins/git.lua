return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("user.configs.git").gs.setup()
        end,
    },
    {
        "tpope/vim-fugitive",
        event = { "BufReadPre", "BufNewFile" },
        cmd = "Git",
        keys = {
            { "<leader><leader>g", "<cmd>Git<cr>", desc = "Fugitive" },
        },
    }
}
