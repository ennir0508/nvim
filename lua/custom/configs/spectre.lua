local M = {}

M.mappings = {
  n = {
    ["<leader>S"] = {
      function()
        require("spectre").toggle()
      end,
      "Toggle Spectre",
    },
    ["<leader>sw"] = {
      function()
        require("spectre").open_visual { select_word = true }
      end,
      "Search current word",
    },
    ["<leader>sp"] = {
      function()
        require("spectre").open_file_search { select_word = true }
      end,
      "Search on current file",
    },
  },
  v = {
    ["<leader>sw"] = {
      function()
        require("spectre").open_visual()
      end,
      "Search current word",
    },
  },
}

return M
