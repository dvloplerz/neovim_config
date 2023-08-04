local lsp = require('lsp-zero').preset({})
local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  if client.supports_method("textDocument/inlayHint") then
    --print("Client support inlayHint!")
    vim.lsp.inlay_hint(bufnr, true)
  end
end)

lsp.extend_cmp()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'rust_analyzer', 'jsonls', 'taplo' },
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
    end,
  },
})

lsp.setup_servers({ 'lua_ls', 'rust_analyzer', 'jsonls', 'taplo' })
lspconfig.rust_analyzer.setup({
  capabilities = lsp_capabilities,
})
lspconfig.lua_ls.setup({
  capabilities = lsp_capabilities,
})
