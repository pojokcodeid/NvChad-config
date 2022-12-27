local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

require "custom.options"

local lpath = vim.fn.stdpath "config" .. "/lua/custom/my-snippets"
vim.g.luasnippets_path = lpath
