local function create_augroup(augroup_name)
    return vim.api.nvim_create_augroup(string.format("sci_%s", augroup_name), { clear = true })
end

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = create_augroup("yank_highlight"),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end
})

-- spell and wrap in text files
vim.api.nvim_create_autocmd("FileType", {
    group = create_augroup("wrap_spell"),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt.wrap = true
        vim.opt.spell = true
    end
})
