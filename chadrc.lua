local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
-- require("custom.lsp")

M.ui = {
  theme_toggle = { "tokyonight", "onedark" },
  theme = "chocolate",
  hl_override = highlights.override,
  hl_add = highlights.add,

  transparency = false,
}

M.plugins = require "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
