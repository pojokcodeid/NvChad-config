local M = {}
local icons = require "custom.icons"

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    --"html",
    --"css",
    --"javascript",
    --"c",
    --"cpp",
    --"python",
    --"java",
    --"php",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "emmet-ls",
    "prettier",
    "prettierd",
    "typescript-language-server",
    "deno",
    -- java
    "jdtls",
    -- c++
    "clangd",
    -- php
    "intelephense",
    -- Python
    "pyright",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  update_focused_file = {
    enable = true,
    update_cwd = true,
  },

  renderer = {
    highlight_git = true,
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
    show_on_dirs = true,
    icons = {
      hint = icons.diagnostics.BoldHint,
      info = icons.diagnostics.BoldInformation,
      warning = icons.diagnostics.BoldWarning,
      error = icons.diagnostics.BoldError,
    },
  },
  view = {
    hide_root_folder = false,
  },
}

M.alpha = {
  dashboard = true,
}

return M
