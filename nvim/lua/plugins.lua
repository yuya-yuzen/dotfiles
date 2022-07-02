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

  -- monokaiテーマ
  use "tanvirtin/monokai.nvim"

  -- シンタックスハイライト
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- ファイラー
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    tag = "nightly",
    config = function() require("plugins.nvim-tree") end
  }

  -- ファジーファインダー（ワークスペースのファイルをあいまい検索して開く）
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons"
    },
    config = function() require("plugins.telescope") end
  }

  -- ドキュメントの日本語化
  use "vim-jp/vimdoc-ja"

  -- ヤンク時に該当範囲をハイライトする
  use "machakann/vim-highlightedyank"

  -- コメントアウトをgccで実行可能
  use "tpope/vim-commentary"

  -- ステータスライン
  use {
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("lualine").setup() end
  }

  -- バッファライン
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require("plugins.bufferline") end
  }

  -- 自動で括弧を閉じる
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end
  }

  -- ターミナル
  use {
    "akinsho/toggleterm.nvim",
    tag = 'v1.*',
    config = function() require("plugins.toggleterm") end
  }

  -- インデントをわかりやすくする
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("plugins.indent-blankline") end
  }

  -- ファイル内検索をわかりやすくする
  use "kevinhwang91/nvim-hlslens"

  -- スクロールバーを表示する
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
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require("plugins.diffview") end
  }
  use {
    "APZelos/blamer.nvim",
    config = function() require("blamer") end
  }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- cmp
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/cmp-buffer"

  -- snippet
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- フォーマッタ・リンタ
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }

  -- Rubyでdefを書いた際に自動でendを追加する
  use "tpope/vim-endwise"

  -- Rubocopで使用
  use {
    "w0rp/ale",
    config = function() require("ale") end
  }
end)
