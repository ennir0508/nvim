local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  --
  -- Coding Assist
  --

  -- nvim-lspconfig - LSP configuration manager
  -- LSP provides suggesting codes, connecting word to definition.
  -- https://github.com/neovim/nvim-lspconfig
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

  -- mason.nvim - Library(LSP, Formatter, Linter and Debugger) Manager
  -- It is able to manage the libraries internally. Their are in nvim-data.
  -- https://github.com/williamboman/mason.nvim
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  -- nvim-jdtls - LSP for java
  --
  {
    "mfussenegger/nvim-jdtls",
  },

  -- Language Parser
  -- It provides query search, syntax highlight. It helps other plugins.
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {
        -- your config
      }
    end,
    lazy = true,
    event = "VeryLazy",
  },

  -- nvim-surround - Completion quotes and brackets
  -- https://github.com/kylechui/nvim-surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  -- Operation Assist

  -- better-escape - Escape insert mode map
  -- If you input `jj` or `jk`, it escape insert mode.
  -- https://github.com/max397574/better-escape.nvim
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- nvim-spectre - Grep search/replace in multifile
  -- https://github.com/nvim-pack/nvim-spectre
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

  -- vim-visual-multi - Multi cursor selector
  -- Select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code).
  -- https://github.com/mg979/vim-visual-multi
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  -- git - Git Assist
  -- This is the simple clone of vim-fugitive.
  -- It is use the command `:Git` e.g. `:Git status`
  -- https://github.com/dinhhuy258/git.nvim
  {
    "dinhhuy258/git.nvim",
    config = function()
      require("custom.configs.git").setup()
    end,
  },

  --
  -- UI
  --

  -- nvim-tree - File Exporer
  -- This is default plugins in the NvChad.
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- nvim-notify - Notification UI
  -- This is notification modern UI in the Neovim.
  -- https://github.com/rcarriga/nvim-notify
  {
    "rcarriga/nvim-notify",
    config = function()
      require("custom.configs.notify").setup()
    end,
  },

  -- telescope - Listing UI
  -- This is default plugins in the NvChad.
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", "bin" },
      },
    },
  },

  -- trouble - Trouble List
  -- It shows the errors and warnings in the project.
  -- https://github.com/folke/trouble.nvim
  {
    "folke/trouble.nvim",
    cmd = require("custom.configs.trouble").cmd,
    opts = require("custom.configs.trouble").opts,
  },

  -- todo-comments - TODO List
  -- Finds and lists all of the TODO, HACK, BUG, etc comment in your project and loads them into a browsable list.
  -- https://github.com/folke/todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = require("custom.configs.todo").cmd,
    opts = require("custom.configs.todo").opts,
  },

  -- markdown-preview - Markdown Viewer in Neovim
  -- https://github.com/iamcco/markdown-preview.nvim
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}

return plugins
