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

M.todoComments = {
  active = true,
  on_config_done = nil,
  ---Add a space b/w comment and the line
  ---@type boolean
  padding = true,

  ---Whether cursor should stay at the
  ---same position. Only works in NORMAL
  ---mode mappings
  sticky = true,

  ---Lines to be ignored while comment/uncomment.
  ---Could be a regex string or a function that returns a regex string.
  ---Example: Use '^$' to ignore empty lines
  ---@type string|function
  ignore = "^$",

  ---Whether to create basic (operator-pending) and extra mappings for NORMAL/VISUAL mode
  ---@type table
  mappings = {
    ---operator-pending mapping
    ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
    basic = true,
    ---Extra mapping
    ---Includes `gco`, `gcO`, `gcA`
    extra = true,
  },

  ---LHS of line and block comment toggle mapping in NORMAL/VISUAL mode
  ---@type table
  toggler = {
    ---line-comment toggle
    line = "gcc",
    ---block-comment toggle
    block = "gbc",
  },

  ---LHS of line and block comment operator-mode mapping in NORMAL/VISUAL mode
  ---@type table
  opleader = {
    ---line-comment opfunc mapping
    line = "gc",
    ---block-comment opfunc mapping
    block = "gb",
  },

  ---LHS of extra mappings
  ---@type table
  extra = {
    ---Add comment on the line above
    above = "gcO",
    ---Add comment on the line below
    below = "gco",
    ---Add comment at the end of line
    eol = "gcA",
  },

  ---Pre-hook, called before commenting the line
  ---@type function|nil
  pre_hook = function(...)
    local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    if loaded and ts_comment then
      return ts_comment.create_pre_hook()(...)
    end
  end,

  ---Post-hook, called after commenting is done
  ---@type function|nil
  post_hook = nil,
}

return M
