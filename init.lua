local autocmd = vim.api.nvim_create_autocmd
local onsave = true
-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

require "custom.winbar"

require "custom.options"
if onsave then
  require "custom.plugins.format_onsave"
end

local lpath = vim.fn.stdpath "config" .. "/lua/custom/my-snippets"
vim.g.luasnippets_path = lpath
