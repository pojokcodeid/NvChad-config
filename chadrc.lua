local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark",
  hl_override = highlights.override,
  hl_add = highlights.add,

  transparency = false,
}

M.plugins = require "custom.plugins"


-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M

