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
  autotag = {
    enable = true,
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
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
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

return M
