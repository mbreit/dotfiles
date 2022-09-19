local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      require('user.treesitter')
    end,
  }

  use {
    "RRethy/nvim-treesitter-endwise",
  }

  use {
    "RRethy/vim-illuminate",
  }

  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').load()
    end
  }

  use { 'kyazdani42/nvim-web-devicons' }

  use 'arkav/lualine-lsp-progress'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'onedark',
          section_separators = '',
          component_separators = ''
        },
        sections = {
          lualine_c = {
            "filename",
            "lsp_progress"
          }
        },
        extensions = {
          "nvim-tree",
          "quickfix",
          "toggleterm"
        }
      }
    end
  }

  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("bufferline").setup {}
    end
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require('indent_blankline').setup({
        show_current_context = true,
        show_current_context_start = false,
      })
    end
  }

  use {
    'lewis6991/gitsigns.nvim', -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup()
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  use({
    "folke/lua-dev.nvim",
    config = function()
      require("lua-dev").setup({
        -- lua-dev detects neovim config directory that does not work if symlinked from another directory
        override = function(root_dir, library)
          -- if require("lua-dev.util").has_file(root_dir, "nvim") then
          library.enabled = true
          library.plugins = true
          -- end
        end,
      })
    end,
  })

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      local lsp = require('lsp-zero')

      lsp.preset('recommended')
      lsp.set_preferences({
        suggest_lsp_servers = false,
        setup_servers_on_start = true,
        set_lsp_keymaps = true,
        configure_diagnostics = true,
        cmp_capabilities = true,
        manage_nvim_cmp = true,
        call_servers = 'local',
        sign_icons = {
          error = '✘',
          warn = '▲',
          hint = '⚑',
          info = ''
        }
      })
      lsp.setup()
      vim.diagnostic.config({
        virtual_text = true
      })
    end,
    after = { "lua-dev.nvim" }
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    "benfowler/telescope-luasnip.nvim",
    -- module = "telescope._extensions.luasnip", -- if you wish to lazy-load
    config = function()
      require('telescope').load_extension('luasnip')
    end
  }

  use {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup()
    end
  }

  use {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require("notify")
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function()
      require("nvim-tree").setup()
    end
  }

  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
  }

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }

  -- use {
  --   "nvim-neorg/neorg",
  --   -- tag = "latest",
  --   ft = "norg",
  --   after = "nvim-treesitter", -- You may want to specify Telescope here as well
  --   config = function()
  --     require('neorg').setup {
  --       load = {
  --         ["core.defaults"] = {}
  --       }
  --     }
  --   end
  -- }

  use {
    'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup {}
      require('orgmode').setup_ts_grammar()
    end
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
