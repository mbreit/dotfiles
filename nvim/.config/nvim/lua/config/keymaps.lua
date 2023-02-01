-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Easier terminal mode
keymap("t", "<C-w><Up>", "<C-\\><C-N><C-w><Up>", opts)
keymap("t", "<C-w><Down>", "<C-\\><C-N><C-w><Down>", opts)
keymap("t", "<C-w><Left>", "<C-\\><C-N><C-w><Left>", opts)
keymap("t", "<C-w><Right>", "<C-\\><C-N><C-w><Right>", opts)
