-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Easier terminal mode
keymap("t", "<C-w><Up>", "<C-\\><C-N><C-w><Up>", opts)
keymap("t", "<C-w><Down>", "<C-\\><C-N><C-w><Down>", opts)
keymap("t", "<C-w><Left>", "<C-\\><C-N><C-w><Left>", opts)
keymap("t", "<C-w><Right>", "<C-\\><C-N><C-w><Right>", opts)
-- Tab to toggle terminal
keymap("t", "<A-/>", "<C-\\><C-N><C-w><Up>", opts)
keymap("n", "<A-/>", ":ToggleTerm<cr>", opts)

-- Exit insert mode and save on <C-s>
keymap("i", "<C-s>", "<Esc>:w<cr>", opts)
keymap("n", "<C-s>", ":w<cr>", opts)
