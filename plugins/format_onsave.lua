function format_filter(client)
  local filetype = vim.bo.filetype
  local n = require "null-ls"
  local s = require "null-ls.sources"
  local method = n.methods.FORMATTING
  local available_formatters = s.get_available(filetype, method)

  if #available_formatters > 0 then
    return client.name == "null-ls"
  elseif client.supports_method "textDocument/formatting" then
    return true
  else
    return false
  end
end
vim.cmd [[
augroup _lsp
     autocmd!
     " autocmd BufWritePre * lua vim.lsp.buf.format{timeout_ms =200, filter=format_filter}
     autocmd BufWritePre * lua vim.lsp.buf.format{filter=format_filter}
  augroup end
]]
