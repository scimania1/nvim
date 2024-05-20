return {
    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        build = (function()
            if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
                vim.notify("make is not available", vim.log.levels.INFO)
                return
            end
            return "make install_jsregexp"
        end)(),
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        opts = {
            history = true,
            region_check_events = "InsertEnter",
            delete_check_events = { "TextChanged" },
        },
        config = function(_, opts)
            require("luasnip").setup(opts)
            for _, file in ipairs(vim.api.nvim_get_runtime_file("lua/user/snippets/*.lua", true)) do
                loadfile(file)()
            end
        end,
    },
}
