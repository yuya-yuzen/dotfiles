local sidebar = require("sidebar-nvim")

sidebar.setup({
  side = "right",
  datetime = { format = "%b/%d(%a), %H:%M", clocks = { { name = "JST" } } },
})

vim.api.nvim_set_keymap("n", "<leader>s", ":SidebarNvimToggle<cr>", { silent = true, noremap = true })
