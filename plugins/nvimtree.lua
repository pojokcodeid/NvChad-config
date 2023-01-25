local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback
local icons = require "custom.icons"

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_label = ":~:s?$?/..?",
    root_folder_modifier = ":t",
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = true,
      },
      glyphs = {
        default = icons.ui.Text,
        symlink = icons.ui.FileSymlink,
        folder = {
          arrow_open = icons.ui.ChevronShortDown,
          arrow_closed = icons.ui.ChevronShortRight,
          default = icons.ui.Folder,
          empty = icons.ui.EmptyFolder,
          empty_open = icons.ui.EmptyFolderOpen,
          open = icons.ui.FolderOpen,
          symlink = icons.ui.FolderSymlink,
          symlink_open = icons.ui.FolderSymlink,
        },
        git = {
          deleted = icons.git.FileDeleted,
          ignored = icons.git.FileIgnored,
          renamed = icons.git.FileRenamed,
          staged = icons.git.FileStaged,
          unmerged = icons.git.FileUnmerged,
          unstaged = icons.git.FileUnstaged,
          untracked = icons.git.FileUntracked,
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = icons.diagnostics.BoldHint,
      info = icons.diagnostics.BoldInformation,
      warning = icons.diagnostics.BoldWarning,
      error = icons.diagnostics.BoldError,
    },
  },
  view = {
    width = 30,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
}
