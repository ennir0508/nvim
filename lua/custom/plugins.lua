local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Formatter & Linter
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- Override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- vim-visual-multi
  -- https://github.com/mg979/vim-visual-multi
  --
  -- Features:
  -- - Select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  -- nvim-spectre
  -- https://github.com/nvim-pack/nvim-spectre
  --
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("spectre").setup()
    end,
  },

  -- better diagnostics list and others
  -- https://github.com/folke/trouble.nvim
  {
    "folke/trouble.nvim",
    cmd = require("custom.configs.trouble").cmd,
    opts = require("custom.configs.trouble").opts,
  },

  -- Finds and lists all of the TODO, HACK, BUG, etc comment in your project and loads them into a browsable list.
  -- https://github.com/folke/todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = require("custom.configs.todo").cmd,
    opts = require("custom.configs.todo").opts,
  },
}

return plugins
