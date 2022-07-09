vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

local lsp_installer = require "nvim-lsp-installer"
local lspconfig = require "lspconfig"

lsp_installer.setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup {
    on_attach = on_attach,
  }
end

-- Automatic Install
lspconfig.sumneko_lua.setup {} -- lua
lspconfig.volar.setup {} -- vue
lspconfig.eslint.setup {} -- eslint
