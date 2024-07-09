local function create_augroup(augroup_name)
    return vim.api.nvim_create_augroup(string.format("sci_%s", augroup_name), { clear = true })
end

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = create_augroup("yank_highlight"),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function()
--         vim.opt.formatoptions:remove({ "c", "r", "o" })
--     end,
--     group = create_augroup("remove_format_options"),
--     pattern = "*",
-- })

-- spell and wrap in text files
vim.api.nvim_create_autocmd("FileType", {
    group = create_augroup("wrap_spell"),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})
