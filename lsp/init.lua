local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "custom.lsp.mason"
require "custom.lsp.config" -- ini hanya untuk windows supaya jdtls jalan, kalau pakai linux remark saja
require("custom.lsp.handlers").setup()
require "custom.lsp.null-ls"
