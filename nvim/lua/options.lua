local options = {
  helplang = "ja",

  number = true,

  cursorline = true,
  cursorcolumn = true,

  list = true,

  encoding = "utf-8",
  fileencoding = "utf-8",

  swapfile = false,
  backup = false,
  writebackup = false,
  undofile = true,

  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  smartindent = true,
  autoindent = true,

  showtabline = 2,

  clipboard = "unnamedplus",

  mouse = "a",

  splitbelow = true,
  splitright = true,

  completeopt = { "menuone", "noinsert"},

  conceallevel = 0,

  wrap = false,

  scrolloff = 8,
  sidescrolloff = 8,

  guifont = "Ricty:h18",

  autoread = true,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
