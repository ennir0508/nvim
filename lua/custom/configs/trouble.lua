local M = {}

M.cmd = { "Trouble", "TroubleToggle" }

M.opts = {
  use_diagnostic_signs = true,
}

M.mappings = {
  n = {
    ["<leader>xx"] = {
      function()
        require("trouble").toggle()
      end,
      "Toggle Trouble",
    },
    ["<leader>xw"] = {
      function()
        require("trouble").toggle "workspace_diagnostics"
      end,
      "Toggle Trouble in Workspace",
    },
    ["<leader>xd"] = {
      function()
        require("trouble").toggle "document_diagnostics"
      end,
      "Toggle Trouble in Document",
    },
    ["<leader>xq"] = {
      function()
        require("trouble").toggle "quickfix"
      end,
      "Toggle Trouble Quickfix",
    },
    ["<leader>xl"] = {
      function()
        require("trouble").toggle "loclist"
      end,
      "Toggle Trouble Locaction list",
    },
    ["gR"] = {
      function()
        require("trouble").toggle "lsp_references"
      end,
      "Toggle Trouble LSP Reference",
    },
  },
}

return M
