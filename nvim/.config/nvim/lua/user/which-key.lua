local function toggle_diagnostics_virtual_text()
  local new_value = not vim.g.diagnostic_virtual_text
  vim.g.diagnostic_virtual_text = new_value
  vim.diagnostic.config({ virtual_text = new_value })
end

require('which-key').register({
  ["<space>"] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["?"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  ["/"] = { "<cmd>Telescope live_grep<cr>", "Search" },
  [":"] = { "<cmd>Telescope buildin<cr>", "Telescope" },
  e = { "<cmd>NvimTreeFocus<cr>", "Tree" },
  q = { ":qa<cr>", "Quit" },
  f = {
    name = "file",
    f = { '<cmd>Telescope file_browser path=%:p:h<cr>', "File Browser" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    g = { '<cmd>Telescope git_files<cr>', "Open Git Files"},
  },
  b = {
    name = "buffers",
    b = { "<cmd>Telescope buffers<cr>", "Switch" },
    d = { "<cmd>Bdelete<cr>", "Delete" },
  },
  h = {
    name = "help",
    h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
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
      I = { "<cmd>LspInfo<cr>", "LSP Info" },
      i = { "<cmd>LspInstall<cr>", "LSP Install" },
      m = { "<cmd>Mason<cr>", "Mason" },
    },
  },
  g = {
    name = "git",
    g = { "<cmd>Neogit<cr>", "Neogit" },
    b = { "<cmd>Telescope git_branches<cr>", "Branches" },
  },
  r = {
    name = "run",
    r = { "<cmd>OverseerRun<cr>", "Run Task" },
    c = { "<cmd>OverseerRunCmd<cr>", "Run CMD" },
    s = { "<cmd>OverseerQuickAction open hsplit<cr>", "Open Runnin Task (Split)" },
    f = { "<cmd>OverseerQuickAction open float<cr>", "Open Runnin Task (Float)" },
    o = { "<cmd>OverseerOpen<cr>", "Show Tasks" },
    t = { "<cmd>OverseerTaskAction<cr>", "Task Action" },
    q = { "<cmd>OverseerQuickAction<cr>", "Quick Action" },
  },
  s = {
    name = "specs",
    l = { function() require('neotest').run.run() end, "Run nearest test" },
    f = { function() require('neotest').run.run(vim.fn.expand('%')) end, "Run test file" },
    r = { function() require('neotest').run.run_last() end, "Run last test" },
  },
  t = {
    name = "terminal",
    t = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
    h = { "<cmd>:tabnew | terminal htop<cr>", "htop" },
    b = { "<cmd>:tabnew | terminal btop<cr>", "btop" },
    g = { "<cmd>:tabnew | terminal lazygit<cr>", "lazygit" },
    d = { "<cmd>:tabnew | terminal lazydocker<cr>", "lazydocker" },
  },
  p = {
    name = "packer",
    s = { "<cmd>PackerSync<cr>", "Sync" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  c = {
    name = "config",
    i = { "<cmd>IndentBlanklineToggle<cr>", "Indent Guides" },
    d = { toggle_diagnostics_virtual_text, "Inline Diagnostics" },
    o = { "<cmd>Telescope vim_options<cr>", "Vim Options" },
  },
  n = {
    name = "notes",
    n = { "<cmd>Telekasten new_note<cr>", "New Note" },
    t = { "<cmd>Telekasten goto_today<cr>", "Today" },
    d = { "<cmd>Telekasten find_daily_notes<cr>", "Find Daily Notes" },
    f = { "<cmd>Telekasten find_notes<cr>", "Find Notes" },
    ['/'] = { "<cmd>Telekasten search_notes<cr>", "Find Notes" },
    p = { "<cmd>Telekasten panel<cr>", "Telekasten Panel" },
  },
}, { prefix = "<leader>" })
