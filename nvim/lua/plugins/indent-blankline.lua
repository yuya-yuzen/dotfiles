vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#111111 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#444444 gui=nocombine]]

require("indent_blankline").setup {
  space_char_blankline = " ",

  show_end_of_line = true,

  show_current_context = true,
  show_current_context_start = true,

  char = "",
  char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
  },
  show_trailing_blankline_indent = false,
}
