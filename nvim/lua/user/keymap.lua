-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

local function toggle_diagnostics_virtual_text()
  local new_value = not vim.g.diagnostic_virtual_text
  vim.g.diagnostic_virtual_text = new_value
  vim.diagnostic.config({ virtual_text = new_value })
end

wk.register({
  ["<space>"] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["?"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  ["/"] = { "<cmd>Telescope live_grep<cr>", "Search" },
  [":"] = { "<cmd>Telescope buildin<cr>", "Telescope" },
  e = { "<cmd>NvimTreeFocus<cr>", "Tree" },
  f = {
    name = "file", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  },
  b = {
    name = "buffers",
    b = { "<cmd>Telescope buffers<cr>", "Switch" },
  },
  l = {
    name = "lang",
    f = { "<cmd>LspZeroFormat<cr>", "Format" },
    r = { vim.lsp.buf.rename, "Rename" },
    a = { vim.lsp.buf.code_action, "Code Action" },
    d = { vim.diagnostic.open_float, "Diagnostic" },
    D = { "<cmd>Trouble<cr>", "All Diagnostics" },
    s = { "<cmd>Telescope luasnip<cr>", "Snippets" },
    l = {
      name = "LSP",
      r = { "<cmd>LspRestart<cr>", "Restart LSP" },
      s = { "<cmd>LspStart<cr>", "Start LSP" },
      S = { "<cmd>LspStop<cr>", "Stop LSP" },
      i = { "<cmd>LspInfo<cr>", "LSP Info" },
      I = { "<cmd>LspInstall<cr>", "LSP Install" },
      m = { "<cmd>Mason<cr>", "Mason" },
    },
  },
  g = {
    name = "git",
    g = { "<cmd>Neogit<cr>", "Neogit" },
    b = { "<cmd>Telescope git_branches<cr>", "Branches" },
  },
  t = {
    name = "terminal",
    t = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
  },
  p = {
    name = "packer",
    s = { "<cmd>PackerSync<cr>", "Sync" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  c = {
    name = "config",
    i = { "<cmd>IndentBlanklineToggle<cr>", "Indent Guides" },
  },
}, { prefix = "<leader>" })
