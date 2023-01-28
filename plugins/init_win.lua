local overrides = require "custom.plugins.overrides"

return {

  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- Override plugin definition options
  ["williamboman/mason-lspconfig.nvim"] = {},
  -- ["jose-elias-alvarez/null-ls.nvim"] = {},
  ["jayp0521/mason-null-ls.nvim"] = {
    requires = { "jose-elias-alvarez/null-ls.nvim" },
    after = "null-ls.nvim",
    event = "BufRead",
    config = function()
      require "custom.plugins.mason_null_ls"
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
    -- requires = { "williamboman/mason-lspconfig.nvim" },
    -- config = function()
    --   require "custom.lsp"
    -- end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
    -- event = "BufRead",
    -- config = function()
    --   require "custom.plugins.treesitter"
    -- end,
  },

  ["williamboman/mason.nvim"] = {
    --   event = "BufRead",
    --   module = "mason",
    --   cmd = {
    --     "Mason",
    --     "MasonInstall",
    --     "MasonUninstall",
    --     "MasonUninstallAll",
    --     "MasonLog",
    --     "MasonUpdate", -- astronvim command
    --     "MasonUpdateAll", -- astronvim command
    --   },
    -- },
    override_options = overrides.mason,
  },

  -- untuk icon
  ["nvim-tree/nvim-web-devicons"] = {
    -- override_options = overrides.wedevicon,
    -- event = "BufWinEnter",
    config = function()
      require "custom.plugins.wedevicon"
    end,
  },
  -- -- Overide tree explorer
  -- ["kyazdani42/nvim-tree.lua"] = {
  --   override_options = overrides.nvimtree,
  --   -- config = function()
  --   --   require "custom.plugins.nvimtree"
  --   -- end,
  -- },

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
  ["jose-elias-alvarez/null-ls.nvim"] = {
    event = "BufWinEnter",
    after = "nvim-lspconfig",
    module = "null-ls",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- Dasboard
  ["goolord/alpha-nvim"] = {
    after = "base46",
    disable = false,
    config = function()
      require "custom.plugins.alpha"
    end,
  },
  -- key mappings
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
  -- java config
  ["mfussenegger/nvim-jdtls"] = {},

  -- custom for view
  -- ["hrsh7th/nvim-cmp"] = {
  --   disable = false,
  --   after = "friendly-snippets",
  --   config = function()
  --     if not vim.fn.has "win32" == 1 then
  --     require "custom.plugins.cmp"
  --     end
  --   end,
  -- },
  -- untuk popup terminal
  ["akinsho/toggleterm.nvim"] = {
    config = function()
      require "custom.plugins.toggleterm"
    end,
  },
  -- untuk menjalankan code program
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
  -- color scheme
  ["folke/tokyonight.nvim"] = {
    commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764",
    event = "BufWinEnter",
    config = function()
      require "custom.plugins.tokyonight"
      -- vim.cmd [[colorscheme tokyonight-night]]
    end,
  },
  -- untuk status line dibwah
  ["nvim-lualine/lualine.nvim"] = {
    event = "BufWinEnter",
    config = function()
      require "custom.plugins.lualine"
    end,
  },
  -- untuk garis warna inden codingan
  ["lukas-reineke/indent-blankline.nvim"] = {
    config = function()
      require "custom.plugins.indentline"
    end,
  },
  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
  -- plugins tambahan

  -- Additional View plugins
  ["rcarriga/nvim-notify"] = {
    event = "BufWinEnter",
    config = function()
      vim.notify = require "notify"
      -- vim.notify = require("notify").setup { background_colour = "#000000" }
    end,
  },
  -- untuk split
  ["mrjones2014/smart-splits.nvim"] = {
    config = function()
      require "custom.plugins.smart-split"
    end,
  },
  -- untuk input dan rename inline input
  ["stevearc/dressing.nvim"] = {
    config = function()
      require "custom.plugins.dressing"
    end,
  },
  -- untuk pewarnaan TODO:
  ["folke/todo-comments.nvim"] = {
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  -- untuk auto close tag
  ["windwp/nvim-ts-autotag"] = {
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "glimmer",
      "handlebars",
      "hbs",
    },
    config = function()
      require "custom.plugins.tsautotag"
    end,
  },
  -- untuk scroll view
  ["karb94/neoscroll.nvim"] = {
    config = function()
      require("neoscroll").setup()
    end,
  },
  ["dstein64/nvim-scrollview"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "custom.plugins.nvimscroll"
    end,
  },
  -- untuk nav diatas
  ["SmiteshP/nvim-navic"] = {
    requires = "neovim/nvim-lspconfig",
  },

  -- Optional Plugins
  -- Zen mode
  ["Pocco81/true-zen.nvim"] = {
    cmd = {
      "TZFocus",
      "TZAtaraxis",
      "TZMinimalist",
    },
    config = function()
      require "custom.plugins.true-zen"
    end,
  },
  --untuk live server web dev
  ["manzeloth/live-server"] = {},
  -- untuk multi select
  ["mg979/vim-visual-multi"] = {},
  -- untuk pewarnaan css
  ["NvChad/nvim-colorizer.lua"] = {
    config = function()
      require "custom.plugins.colorizer"
    end,
  },
  -- untuk auto comp commond mode
  ["gelguy/wilder.nvim"] = {
    config = function()
      local wilder = require "wilder"
      wilder.setup { modes = { ":", "/", "?" } }
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer {
          highlighter = wilder.basic_highlighter(),
          left = { " ", wilder.popupmenu_devicons() },
          right = { " ", wilder.popupmenu_scrollbar() },
        }
      )
    end,
  },
  -- untuk auto save
  ["907th/vim-auto-save"] = { event = "InsertEnter" },
  -- Manage your yank history
  ["gbprod/yanky.nvim"] = {
    config = function()
      require "custom.plugins.yanky"
    end,
  },
  -- Handy unix command inside Vim (Rename, Move etc.)
  ["tpope/vim-eunuch"] = { cmd = { "Rename", "Delete" } },
  -- untuk format yang belum di config null-ls
  ["sbdchd/neoformat"] = { cmd = { "Neoformat" } },
  -- alternatif pengganti code runner
  ["krshrimali/nvim-autorunner"] = {
    requires = "rcarriga/nvim-notify",
  },
  -- For Debuging
  ["mfussenegger/nvim-dap"] = {
    disable = vim.fn.has "win32" == 1,
    event = "BufRead",
  },
  ["rcarriga/nvim-dap-ui"] = {
    -- requires = { "mfussenegger/nvim-dap" },
    disable = vim.fn.has "win32" == 1,
    event = "BufRead",
    config = function()
      require "custom.plugins.dapui"
    end,
  },
  ["jayp0521/mason-nvim-dap.nvim"] = {
    -- requires = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    disable = vim.fn.has "win32" == 1,
    event = "BufRead",
    config = function()
      require "custom.plugins.mason_dap"
    end,
  },
}
