require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- place this in one of your configuration file(s)
keymap("n", 'f', ":HopWord<CR>", opts)
