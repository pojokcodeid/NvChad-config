local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

-- local b = null_ls.builtins
--
-- local sources = {
--
--   -- webdev stuff
--   b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
--   -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
--   b.formatting.prettier, -- so prettier works only on these filetypes
--
--   -- Lua
--   b.formatting.stylua,
--
--   -- cpp
--   b.formatting.clang_format,
-- }

local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  debug = false,
  -- sources = sources,
  sources = {
    formatting.prettier,
    --formatting.prettierd,
    formatting.black.with { extra_args = { "--fast" } }, -- install sudo apt -y install black
    formatting.stylua,
    --formatting.eslint_d,
    --formatting.clang_format.with { filetype = { "cpp", "c" } }, -- install sudo apt install clang-format
    --formatting.google_java_format.with { filetype = { "java" } },
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
