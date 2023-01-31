local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = false,
  sources = {
    -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    -- formatting.prettier,  --ini untuk frontend dev (html,css,javascript etc..)
    -- formatting.black.with { extra_args = { "--fast" } },  -- ini untuk python
    formatting.stylua, --ini untuk lua
    -- formatting.eslint_d,  -- ini untuk javascrpt dan typescript
    -- formatting.google_java_format,  -- ini untuk java
    -- formatting.phpcbf,  -- ini untuk php
    -- formatting.clang_format, --ini untuk c++
    -- diagnostics.flake8  --ini untuk python
    -- diagnostics.eslint_d,  -- ini untuk javascript
    -- formatting.dart_format,   -- ini untuk dart
    -- formatting.rustfmt,  --ini untuk rust
  },

  on_attach = function(client, bufnr)
    --if client.resolved_capabilities.document_formatting then
    --vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format{async=true}")
    --end
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
          -- vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}
