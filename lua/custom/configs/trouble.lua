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
    ["[q"] = {
      function()
        if require("trouble").is_open() then
          require("trouble").previous { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      "Previous trouble/quickfix item",
    },
    ["]q"] = {
      function()
        if require("trouble").is_open() then
          require("trouble").next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      "Next trouble/quickfix item",
    },
  },
}

return M
