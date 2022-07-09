require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diagnostics' },
    lualine_c = {
      {
        'filename',
        path = 1,
      },
      'filetype',
    },
    lualine_x = { 'encoding' },
    lualine_y = { 'fileformat' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'progress' },
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
