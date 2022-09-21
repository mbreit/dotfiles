local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  -- TODO: Lua LSP server has warning about fn.glob and missing parameters,
  -- but packer documents bootstrapping this way
  ---@diagnostic disable-next-line: missing-parameter
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
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.buttons.val = {
        dashboard.button("n", "  New file", "<cmd>ene <cr>"),
        dashboard.button("e", "  Explore", "<cmd>NvimTreeFocus<cr>"),
        dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
        dashboard.button("r", "  Recently opened files", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("q", "  Quit NVIM", ":qa<CR>"),

        -- dashboard.button("SPC f h", "  Recently opened files"),
        -- dashboard.button("SPC f r", "  Frecency/MRU"),
        -- dashboard.button("SPC f g", "  Find word"),
        -- dashboard.button("SPC f m", "  Jump to bookmarks"),
        -- dashboard.button("SPC s l", "  Open last session"),
      }
      alpha.setup(dashboard.config)
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua", "ruby", "rust", "javascript", "typescript", "json", "json5", "yaml", "bash", "css", "html", "scss",
          "vue"
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        endwise = {
          enable = true,
        },
      }
    end,
  }

  use 'RRethy/nvim-treesitter-endwise'

  use 'RRethy/vim-illuminate'

  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').load()
    end,
  }

  use 'kyazdani42/nvim-web-devicons'

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
            'filename',
            'lsp_progress'
          }
        },
        extensions = {
          'nvim-tree',
          'quickfix',
          'toggleterm'
        }
      }
    end,
  }

  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}
    end,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
        show_current_context = true,
        show_current_context_start = false,
      })
      vim.g.indent_blankline_enabled = false
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup()
    end,
  }

  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function()
      require('toggleterm').setup()
    end,
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  }

  use({
    'kylechui/nvim-surround',
    tag = '*',
    config = function()
      require('nvim-surround').setup()
    end,
  })

  use({
    'folke/lua-dev.nvim',
    config = function()
      require('lua-dev').setup({
        override = function(root_dir, library)
          if require("lua-dev.util").has_file(root_dir, "nvim") then
            library.enabled = true
            library.plugins = true
          end
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

      -- null_ls
      { 'jose-elias-alvarez/null-ls.nvim' },
      { 'jayp0521/mason-null-ls.nvim' },

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
      })
      lsp.setup()
      vim.diagnostic.config({
        virtual_text = true
      })
      vim.g.diagnostic_virtual_text = true

      -- null_ls integration, see https://github.com/VonHeikemen/lsp-zero.nvim/issues/46
      require('null-ls').setup()

      local null_ls = require('null-ls')
      local null_opts = lsp.build_options('null-ls', {})

      require('mason-null-ls').setup()
      require('mason-null-ls').setup_handlers({
        -- TODO: mason-null-ls should be able to auto register all installed sources
        markdownlint = function()
          null_ls.register(null_ls.builtins.formatting.markdownlint)
          null_ls.register(null_ls.builtins.diagnostics.markdownlint.with({
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity.INFO
            end,
          }))
        end
      })

      null_ls.setup({
        on_attach = null_opts.on_attach,
      })
    end,
    after = { 'lua-dev.nvim' },
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use {
    'benfowler/telescope-luasnip.nvim',
    -- module = "telescope._extensions.luasnip", -- if you wish to lazy-load
    config = function()
      require('telescope').load_extension('luasnip')
    end,
  }

  use {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup()
    end,
  }

  use {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function()
      require('nvim-tree').setup()
    end,
  }

  use {
    'TimUntersberger/neogit',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end,
  }

  use {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }

  use {
    'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup()
      require('orgmode').setup_ts_grammar()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
