require("toggleterm").setup()

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>j", ":ToggleTerm direction=float<CR>", opts)

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  hidden = true,
})

function LazygitToggle()
  lazygit:toggle()
end

keymap("n", "lg", "<cmd>lua LazygitToggle()<CR>", opts)
