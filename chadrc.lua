local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
-- require("custom.lsp")

M.ui = {
  theme_toggle = { "tokyonight", "onedark" },
  theme = "tokyonight",
  hl_override = highlights.override,
  hl_add = highlights.add,

  transparency = false,
}

if not vim.fn.has "win32" == 1 then
  M.plugins = require "custom.plugins"
else 
  M.plugins = require "custom.plugins.init_win"
end

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
