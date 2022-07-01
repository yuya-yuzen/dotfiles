local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>p", ":Telescope find_files<CR>", opts)
keymap("n", "<leader><S-f>", ":Telescope live_grep<CR>", opts) -- ripgrepが必要

