return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
      "marilari88/neotest-vitest",
      "rouge8/neotest-rust",
    },
    opts = function()
      ---@type neotest.Config
      return {
        adapters = {
          require("neotest-rspec"),
          require("neotest-vitest"),
          require("neotest-rust"),
        },
        -- consumers = {
        --   overseer = require("neotest.consumers.overseer"),
        -- },
        quickfix = {
          open = false,
        },
      }
    end,
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run()
        end,
        "Run nearest test",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        "Run test file",
      },
      {
        "<leader>tr",
        function()
          require("neotest").run.run_last()
        end,
        "Run last test",
      },
      {
        "<leader>to",
        function()
          require("neotest").output_panel.open()
        end,
        "Open test output",
      },
    },
  },
}
