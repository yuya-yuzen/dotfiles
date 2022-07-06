vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- monokai
  use "tanvirtin/monokai.nvim"

  -- Syntax Highlight
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use {
    "p00f/nvim-ts-rainbow",
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function() require("plugins.nvim-ts-rainbow") end
  }
  use {
    "haringsrob/nvim_context_vt",
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function() require("nvim_context_vt").setup() end
  }
  use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function() require('hlargs').setup() end
  }
  use {
    "SmiteshP/nvim-gps",
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lualine/lualine.nvim",
    },
    config = function()
      require("nvim-gps").setup()
    end
  }
  use 'mtdl9/vim-log-highlighting'

  -- File Explorer
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    tag = "nightly",
    config = function() require("plugins.nvim-tree") end
  }

  -- Fuzzy Finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons"
    },
    config = function() require("plugins.telescope") end
  }

  -- Japanese Help
  use "vim-jp/vimdoc-ja"

  -- Yank
  use "machakann/vim-highlightedyank"

  -- Comment Out
  use "tpope/vim-commentary"

  -- Status Line
  use {
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("plugins.lualine") end
  }

  -- Buffer
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require("plugins.bufferline") end
  }

  -- Brackets
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end
  }
  use {
    "windwp/nvim-ts-autotag",
    require = "nvim-treesitter/nvim-treesitter",
    config = function() require("nvim-ts-autotag").setup() end,
  }
  use {
    "andymass/vim-matchup",
    require = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.vim-matchup")
    end
  }

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
    tag = 'v1.*',
    config = function() require("plugins.toggleterm") end
  }

  -- Indent
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("plugins.indent-blankline") end
  }

  -- Search in File
  use "kevinhwang91/nvim-hlslens"

  -- Scroll
  use {
    'yuttie/comfortable-motion.vim',
    config = function() require("plugins.comfortable-motion") end
  }

  -- Scrollbar
  use {
    "petertriho/nvim-scrollbar",
    requires = {
      "kevinhwang91/nvim-hlslens",
      "folke/tokyonight.nvim"
    },
    config = function() require("plugins.nvim-scrollbar") end
  }

  -- Git
  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    config = function() require("plugins.neogit") end
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require("plugins.diffview") end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('plugins.gitsigns') end
  }
  use {
    "APZelos/blamer.nvim",
    config = function() require("blamer") end
  }
  use {
    'akinsho/git-conflict.nvim',
    config = function() require('git-conflict').setup() end
  }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "onsails/lspkind.nvim"
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("plugins.trouble") end
  }
  use {
    "j-hui/fidget.nvim",
    config = function() require("fidget").setup() end
  }

  -- Completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"

  -- Snippet
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- Formatter, Linter
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }

  -- Ruby
  use "tpope/vim-endwise"

  -- Rubocop
  use {
    "w0rp/ale",
    config = function() require("ale") end
  }

  -- Notify
  use {
    'rcarriga/nvim-notify',
    config = function() vim.notify = require('notify') end,
  }

  -- Sidebar
  use {
    "sidebar-nvim/sidebar.nvim",
    config = function()
      require("plugins.sidebar")
    end
  }

  -- Display Key Map
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }

  -- Startup
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  }

  -- Easymotion
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function() require 'plugins.hop' end,
  }

  -- Multi Cursor
  use 'mg979/vim-visual-multi'

  -- Test
  use {
    "klen/nvim-test",
    config = function()
      require('nvim-test').setup()
    end
  }
end)
