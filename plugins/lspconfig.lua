-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities
local on_attach = require("custom.lsp.handlers").on_attach
local capabilities = require("custom.lsp.handlers").capabilities

local lspconfig = require "lspconfig"

local servers = { "sumneko_lua", "html", "cssls", "tsserver", "clangd", "emmet_ls", "intelephense", "pyright" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
