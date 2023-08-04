return {
  {
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'dev-v3',
    },
    { 'hrsh7th/nvim-cmp' },                    -- Required
    {
      'neovim/nvim-lspconfig',                 -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- LSP Support
      { 'hrsh7th/cmp-nvim-lsp' },              -- Required
      { 'hrsh7th/cmp-buffer' },                -- Required
      { 'hrsh7th/cmp-path' },                  -- Required
      { 'saadparwaiz1/cmp_luasnip' },          -- Required
      { 'hrsh7th/cmp-nvim-lua' },              -- Required
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        event = 'LspAttach',
        opts = {
          window = {
            blend = 0
          },
          text = {
            spinner = 'arc',
          },
        },
      },
      {
        'b0o/schemastore.nvim'
      },

      -- Autocompletion
      {
        'mtoohey31/cmp-fish',
        event = {
          "BufRead *.fish"
        },
      },
      {
        'L3MON4D3/LuaSnip',
        opts = {
          history = true,
          updateevents = { 'TextChanged', 'TextChangedI' },
        },
      }, -- Required
      {
        "hrsh7th/cmp-nvim-lsp-signature-help"
      },
      {
        "SmiteshP/nvim-navic"
      },
      {
        "simrat39/rust-tools.nvim",
        dependencies = {
          { 'rust-lang/rust.vim' },
          { 'nvim-lua/plenary.nvim' },
          { 'mfussenegger/nvim-dap' },
          {
            'saecki/crates.nvim',
            dependencies = {
              'nvim-lua/plenary.nvim',
            },
            event = {
              "BufRead Cargo.toml",
            },
          },
        },
      },
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-lua/plenary.nvim"
      },
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
    priority = 1000,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = function()
      local ts_update = require "nvim-treesitter.install".update({ with_sync = true })
      ts_update()
    end
  },
  {
    "mbbill/undotree",
    lazy = true,
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    dependencies = {
      {
        'nvim-tree/nvim-web-devicons',
        opt = true,
      },
    },
  },
  {
    "tpope/vim-fugitive"
  },
}
