local overrides = require "custom.plugins.overrides"

return {

  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      --require "plugins.configs.lspconfig"
      --require "custom.plugins.lspconfig"
      require "custom.lsp"
    end,
  },
  ["williamboman/mason.nvim"] = {},
  ["williamboman/mason-lspconfig.nvim"] = {},
  ["RRethy/vim-illuminate"] = {},
  ["williamboman/nvim-lsp-installer"] = {},
  ["jose-elias-alvarez/null-ls.nvim"] = {},

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  -- ["williamboman/mason.nvim"] = {
  --   override_options = overrides.mason,
  -- },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- ["akinsho/bufferline.nvim"] = {
  --   tag = "v3.*",
  --   requires = "nvim-tree/nvim-web-devicons",
  --   config = function()
  --     require "custom.plugins.bufferline"
  --   end,
  -- },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  -- ["jose-elias-alvarez/null-ls.nvim"] = {
  --   after = "nvim-lspconfig",
  --   config = function()
  --     require "custom.plugins.null-ls"
  --   end,
  -- },

  ["goolord/alpha-nvim"] = {
    after = "base46",
    disable = false,
    config = function()
      require "custom.plugins.alpha"
    end,
  },

  ["folke/which-key.nvim"] = {
    disable = false,
    module = "which-key",
    keys = { "<leader>", '"', "'", "`" },
    config = function()
      require "custom.plugins.whichkey"
    end,
    setup = function()
      require("core.utils").load_mappings "whichkey"
    end,
  },

  ["hrsh7th/nvim-cmp"] = {
    disable = false,
    after = "friendly-snippets",
    config = function()
      require "custom.plugins.cmp"
    end,
  },

  ["folke/tokyonight.nvim"] = {
    config = function()
      require "custom.plugins.colorscheme"
    end,
  },

  ["akinsho/toggleterm.nvim"] = {
    config = function()
      require "custom.plugins.toggleterm"
    end,
  },
  ["CRAG666/code_runner.nvim"] = {
    config = function()
      require "custom.plugins.coderunner"
    end,
  },
  ["NvChad/ui"] = {
    override_options = {
      statusline = {
        disable = true,
        separator_style = "block", -- default/round/block/arrow
        -- overriden_modules = function()
        --   return require "custom.plugins.lualine"
        -- end,
      },
    },
  },
  -- ["mfussenegger/nvim-jdtls"] = {},
  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
  -- plugins tambahan
  ["rcarriga/nvim-notify"] = {
    config = function()
      vim.notify = require "notify"
    end,
  },
  ["mrjones2014/smart-splits.nvim"] = {
    config = function()
      require "custom.plugins.smart-split"
    end,
  },
  ["stevearc/dressing.nvim"] = {
    config = function()
      require "lua.custom.plugins.dressing"
    end,
  },
  ["folke/todo-comments.nvim"] = {
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
}
