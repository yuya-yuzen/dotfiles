require('auto-session').setup {
  log_level = 'info',
  auto_session_suppress_dirs = { '~/', '~/Projects' },
}

vim.api.nvim_set_keymap("n", "<leader>ss", ":SaveSession ./session<cr> :wqa<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>rs", ":RestoreSession ./session<cr><cr>", { silent = true, noremap = true })
