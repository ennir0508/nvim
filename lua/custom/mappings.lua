---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- increment/decrement
    ["+"] = { "<C-a>", "Increment", opts = { nowait = true } },
    ["-"] = { "<C-x>", "Decrement", opts = { nowait = true } },

    ["s"] = { '"_s', "replace char without yank and change to insert mode" },
    ["x"] = { '"_x', "erase char without yank" },
    ["<BS>"] = { '"_xh', "Backspace is enable in nomal mode" },

    ["<C-a>"] = { "gg<S-v>G", "Select All" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
