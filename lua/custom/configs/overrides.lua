local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- all ext stuff
    "diagnostic-languageserver",
    "efm",

    -- dockerfile stuff
    "docker-compose-language-service",
    "dockerfile-language-server",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "json-lsp",

    "yaml-language-server",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    "powershell-editor-services",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },

      glyphs = {
        -- default = "󰈚",
        default = "󰈙", -- nf-md-file_document
        symlink = "",
        folder = {
          default = "󰉋", -- nf-md-folder
          empty = "󰉖", -- nf-md-folder_outline
          empty_open = "󰷏", -- nf-md-folder_open_outline
          open = "󰝰", -- nf-md-folder_open
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "M",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "?", -- nf-fa-question
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

M.gitsigns = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "-" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "│" },
  },
}

return M
