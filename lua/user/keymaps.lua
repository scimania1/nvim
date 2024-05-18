local map = vim.keymap.set

-- some defaults
map("n", "Q", "<nop>")
map("n", "<space>", "<nop>")

-- keep the cursor at its position when joining lines
map("n", "J", "mzJ`z")

-- always center the screen when moving by half screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- for better navigation when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- window navigation
map("n", "<C-h>", "<C-W>h")
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-l>", "<C-W>l")

-- window resizing
map("n", "<M-,>", "<C-W>5<")
map("n", "<M-.>", "<C-W>5>")
map("n", "<M-t>", "<C-W>+")
map("n", "<M-s>", "<C-W>-")

-- moving lines in visual mode
map("v", "<M-j>", ":m '>+1<cr>gv=gv")
map("v", "<M-k>", ":m '<-2<cr>gv=gv")

-- easier indentation
map("v", "<", "<gv")
map("v", ">", ">gv")
map("x", "<leader>p", '"_dP')

-- for dealing with wrapping
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- stop hlsearch
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- terminal escape
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })

-- tab bindings
map("n", "<leader>tt", "<cmd>tabnew|term<CR>", { desc = "Open terminal in a new tab" })
map("n", "<leader>ts", function()
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)
map("n", "<M-h>", "gT")
map("n", "<M-l>", "gt")

-- yanking and putting
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- lsp format
map("n", "<leader>f", function()
  vim.lsp.buf.format({ timeout_ms = 2000 })
end)
