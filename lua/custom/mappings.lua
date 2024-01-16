---@type MappingsTable
local M = {}

M.general = {
  -- Noraml Mode
  n = {
    [";"] = { ":", "Enter command mode", opts = { nowait = true } },

    -- Increment/Decrement
    ["+"] = { "<C-a>", "Increment", opts = { nowait = true } },
    ["-"] = { "<C-x>", "Decrement", opts = { nowait = true } },

    ["s"] = { '"_s', "Replace char without yank and change to insert mode" },
    ["x"] = { '"_x', "Erase char without yank" },

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
    [">"] = { ">gv", "Indent" },
  },
}

-- more keybinds!

return M
