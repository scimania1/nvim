require("telescope").setup({
    defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_ignore_patterns = { ".git/", "node_modules" },
        path_display = { "filename_first" },
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
    },
    extensions = {
        fzf = {},
    },
})

local ok, err = pcall(require("telescope").load_extension, "fzf")
if not ok then
    vim.notify("telescope-fzf extension was not built or loaded", vim.log.levels.WARN)
end
