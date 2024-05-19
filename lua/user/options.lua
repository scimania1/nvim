vim.opt.completeopt = { "menu", "menuone", "noinsert" }
vim.opt.conceallevel = 2
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.expandtab = true
vim.opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}
vim.opt.formatoptions = "jtcqn"
-- TODO: check if the program is installed by running checkhealth
vim.opt.grepprg = "rg --vimgrep"
vim.opt.guicursor =
    "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.virtualedit = "block"
vim.opt.wrap = false

if vim.fn.has("nvim-0.10.0") then
    vim.opt.smoothscroll = true
end

vim.g.mapleader = " "
