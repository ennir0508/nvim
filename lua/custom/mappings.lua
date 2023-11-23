---@type MappingsTable
local M = {}

--
-- General Mappings
--
M.general = {
  -- Noraml Mode
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- increment/decrement
    ["+"] = { "<C-a>", "Increment", opts = { nowait = true } },
    ["-"] = { "<C-x>", "Decrement", opts = { nowait = true } },

    ["s"] = { '"_s', "replace char without yank and change to insert mode" },
    ["x"] = { '"_x', "erase char without yank" },

    ["<C-a>"] = { "gg<S-v>G", "Select All" },

    -- Split window
    ["ss"] = { "<cmd>split<cr>", "Sprit window to horizon" },
    ["sv"] = { "<cmd>vsplit<cr>", "Sprit window to virticle" },

    -- Resize window
    ["<C-up>"] = { "<C-w>+", "Increase height" },
    ["<C-down>"] = { "<C-w>-", "Decrease height" },
    ["<C-right>"] = { "<C-w>>", "Increase width" },
    ["<C-left>"] = { "<C-w><", "Decrease width" },
  },

  -- Insert Mode
  i = {
    ["<C-f>"] = { "<ESC>//<left>", "Switch to Search Mode" },
    ["<C-r>"] = { "<ESC>:%s///g<left><left><left>", "Switch to Replace Mode" },
  },

  -- Visual Mode
  v = {
    [">"] = { ">gv", "indent" },
  },
}

--
-- Plugins Mappings
--

-- Specture: Search and replace in workspace
-- https://github.com/nvim-pack/nvim-spectre
M.spectre = {
  n = {
    ["<leader>sr"] = {
      function()
        require("spectre").open()
      end,
      "Replace in files (Spectre)",
    },
  },
}
--
M.trouble = {
  n = {
    ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
    ["<leader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)" },
    ["<leader>xL"] = { "<cmd>TroubleToggle loclist<cr>", "Location List (Trouble)" },
    ["<leader>xQ"] = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix List (Trouble)" },
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

M.todo_comments = {
  n = {
    ["[t"] = {
      function()
        require("todo-comments").jump_next()
      end,
      "Next todo comment",
    },
    ["]t"] = {
      function()
        require("todo-comments").jump_prev()
      end,
      "Previous todo comment",
    },
    ["<leader>xt"] = { "<cmd>TodoTrouble<cr>", "Todo (Trouble)" },
    ["<leader>xT"] = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", "Todo/Fix/Fixme (Trouble)" },
    ["<leader>st"] = { "<cmd>TodoTelescope<cr>", "Todo" },
    ["<leader>sT"] = { "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", "Todo/Fix/Fixme" },
  },
}

M.markdown = {
  n = {
    ["<leader>mdp"] = { "<cmd> MarkdownPreview <cr>", "Markdown Preview" },
    ["<leader>mds"] = { "<cmd> MarkdownPreviewStop <cr>", "Markdown Preview stop" },
    ["<leader>mdt"] = { "<cmd> MarkdownPreviewToggle <cr>", "Markdown Preview toggle" },
  },
}

M.dap = {
  n = {
    ["<leader>Dt"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    ["<leader>Db"] = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    -- ["<F8>"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    ["<leader>DC"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    ["<leader>Dd"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    ["<leader>Dg"] = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    ["<F6>"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    ["<F5>"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    ["<F7>"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    ["<F4>"] = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    ["<F8>"] = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    ["<leader>dc"] = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    ["<leader>du"] = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
  },
}

return M
