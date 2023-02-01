return {
  {
    "saecki/crates.nvim",
    dependencies = { "jose-elias-alvarez/null-ls.nvim", "hrsh7th/nvim-cmp" },
    event = "BufRead Cargo.toml",
    opts = {
      autoload = false,
      null_ls = {
        enabled = true,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
          require("crates").update()
          require("cmp").setup.buffer({ sources = { { name = "crates" } } })
        end,
      })
    end,
  },
}
