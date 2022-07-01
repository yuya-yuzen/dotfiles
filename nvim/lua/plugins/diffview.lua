local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>g", ":DiffviewOpen<CR>", { noremap = true, silent = true })
keymap("n", "<leader>w", ":DiffviewClose<CR>", { noremap = true, silent = true })
