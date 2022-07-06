local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "t", ":bnext<CR>", opts)
keymap("n", "T", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "∆", "<Esc>:m .+1<CR>", opts)
keymap("n", "˚", "<Esc>:m .-2<CR>", opts)

-- ファイル内検索のハイライトを消す
keymap("n", "<ESC><ESC>", ":nohl<CR>", opts)

keymap("n", "<C-a>", "^", opts)
keymap("n", "<C-e>", "$", opts)

keymap("n", "Y", "y$", opts)
keymap("n", "U", "<C-r>", opts)

keymap("n", "<C-s>", ":split<CR>", opts)
keymap("n", "<C-v>", ":vsplit<CR>", opts)

keymap("n", "q", ":bdelete<CR>", opts)

keymap("n", "<leader>t", ":tabe<CR>:terminal<CR>i", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "∆", ":m .+1<CR>", opts)
keymap("v", "˚", ":m .-2<CR>", opts)

keymap("t", "<ESC>", "<C-\\><C-n>", opts)
