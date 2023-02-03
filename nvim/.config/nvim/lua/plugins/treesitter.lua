return {
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = {
      "TSUpdateSync",
    },
    ---@type TSConfig
    opts = {
      sync_install = true,
      highlight = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "css",
        "scss",
        "vue",
        "ruby",
        "rust",
      },
    },
  },
}
