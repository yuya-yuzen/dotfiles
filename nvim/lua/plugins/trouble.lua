require("trouble").setup()

vim.api.nvim_set_keymap("n", "<leader>xx", ":TroubleToggle<cr>", { silent = true, noremap = true })
