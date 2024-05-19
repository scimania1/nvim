return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("user.configs.harpoon")
    end,
}
