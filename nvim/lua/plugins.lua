vim.cmd([[packadd packer.nvim]])

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP =
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- colorscheme
  use({
    "tanvirtin/monokai.nvim",
    config = function()
      require("monokai").setup()
    end,
  })

  -- File Explorer
  use({
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    tag = "nightly",
    config = function()
      require("nvim-tree").setup()
      vim.api.nvim_set_keymap("n", "<leader>b", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    end,
  })

  -- Fuzzy Finder
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>p", ":Telescope find_files<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope live_grep<CR>", { noremap = true, silent = true }) -- ripgrepが必要
    end,
  })

  -- Japanese Help
  use("vim-jp/vimdoc-ja")

  -- Yank
  use("machakann/vim-highlightedyank")

  -- Status Line
  use({
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.lualine")
    end,
  })

  -- Buffer
  use({
    "akinsho/bufferline.nvim",
    tag = "v2.*",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("bufferline").setup()
      vim.opt.termguicolors = true
    end,
  })

  -- Brackets
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  })

  -- Terminal
  use({
    "akinsho/toggleterm.nvim",
    tag = "v1.*",
    config = function()
      require("plugins.toggleterm")
    end,
  })

  -- Search in File
  -- 検索後 n keyで次の結果、 N keyで前の結果に移動
  use("kevinhwang91/nvim-hlslens")

  -- Scrollbar
  use({
    "petertriho/nvim-scrollbar",
    requires = {
      "kevinhwang91/nvim-hlslens",
      "folke/tokyonight.nvim",
    },
    config = function()
      require("plugins.nvim-scrollbar")
    end,
  })

  -- Notify
  use({
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  })

  -- Display Key Map
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  })

  -- Easymotion
  use({
    "phaazon/hop.nvim",
    branch = "v1", -- optional but strongly recommended
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
      vim.api.nvim_set_keymap("n", "f", ":HopWord<CR>", { noremap = true, silent = true })
    end,
  })

  -- Multi Cursor
  use("mg979/vim-visual-multi")

  -- Syntax highlight
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
      })
    end,
  })

  -- Formatter, Linter
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.null-ls")
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
