local has_make = vim.fn.executable("make") == 1
local has_cmake = vim.fn.executable("cmake") == 1

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = has_make and "make"
                    or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
                enabled = has_make or has_cmake,
            },
            { "nvim-lua/plenary.nvim" },
        },
        keys = function()
            local builtin = require("telescope.builtin")
            local themes = require("telescope.themes")
            return {
                {
                    "<leader>sf",
                    function()
                        builtin.find_files({ hidden = true })
                    end,
                },
                {
                    "<leader>sh",
                    function()
                        builtin.help_tags()
                    end,
                },
                {
                    "<leader>sg",
                    function()
                        builtin.live_grep()
                    end,
                },
                {
                    "<leader>sw",
                    function()
                        builtin.grep_string(themes.get_dropdown())
                    end,
                },
                {
                    "<leader>/",
                    function()
                        builtin.current_buffer_fuzzy_find(themes.get_dropdown({ previewer = false }))
                    end,
                },
            }
        end,
        config = function()
            require("user.configs.telescope")
        end,
    },
}
