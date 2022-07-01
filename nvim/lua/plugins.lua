vim.cmd[[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require("packer").startup(function()
  -- packer自身
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
    }
  }

  -- telescopeでアイコン表示するため
  use "lambdalisue/nerdfont.vim"

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
    config = function() require("plugins.lualine") end
  }
end)
