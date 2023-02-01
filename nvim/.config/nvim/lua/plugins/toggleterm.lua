return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" },
      { "<A-/>", "<C-\\><C-N><C-w><Up>", mode = "t" },
      { "<A-/>", ":ToggleTerm<cr>" },
    },
  },
}
