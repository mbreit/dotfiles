return {
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
    },
    opts = function(_, opts)
      opts.ensure_installed = {}
    end
  },
}
