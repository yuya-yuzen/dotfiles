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

  -- Colorscheme
  use({
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd([[colorscheme nightfox]])
    end,
  })

  -- File Explorer
  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
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
      vim.api.nvim_set_keymap("n", "<leader>g", ":Telescope git_status<CR>", { noremap = true, silent = true })
    end,
  })

  -- Yank
  use("machakann/vim-highlightedyank")

  -- Status Line
  use({
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("lualine").setup()
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
    tag = "*",
    config = function()
      require("plugins.toggleterm")
    end,
  })

  -- Search in File
  -- 検索後 n keyで次の結果、 N keyで前の結果に移動
  use({
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup()
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
  -- ctrl + N で複数選択
  use("mg979/vim-visual-multi")

  -- Syntax Highlight
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
      })
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup()
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

  -- Comment
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  -- Indent Line
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      })
    end,
  })

  -- Git
  use({
    "lewis6991/gitsigns.nvim", -- 差分のある箇所をエディタ上に色で表示
    config = function()
      require("gitsigns").setup()
      vim.api.nvim_set_keymap(
        "n",
        "]c",
        '<cmd>lua require("gitsigns").next_hunk()<CR>',
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "[c",
        '<cmd>lua require("gitsigns").prev_hunk()<CR>',
        { noremap = true, silent = true }
      )
    end,
  })

  -- memolist
  use({
    "glidenote/memolist.vim",
    config = function()
      vim.g.memolist_path = "~/.memolist/memo"
      vim.g.memolist_memo_suffix = "md"
      vim.g.memolist_fzf = 1
      vim.g.memolist_template_dir_path = "~/.memolist/memotemplates"
    end,
  })
  use({
    "delphinus/telescope-memo.nvim",
    requires = {
      "glidenote/memolist.vim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("memo")
      vim.api.nvim_set_keymap("n", "<leader>mn", ":MemoNew<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>ml", ":Telescope memo list<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>mg", ":Telescope memo live_grep<CR>", { noremap = true, silent = true })
    end,
  })

  -- Scrollbar
  use({
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  })

  -- Markdown Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })

  -- Completion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      require("plugins.nvim-cmp")
    end,
  })

  -- Notify
  use({
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({})
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
