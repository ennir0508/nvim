local M = {}

M.mappings = {
  n = {
    ["<leader>mdp"] = { "<cmd> MarkdownPreview <cr>", "Markdown Preview" },
    ["<leader>mds"] = { "<cmd> MarkdownPreviewStop <cr>", "Markdown Preview stop" },
    ["<leader>mdt"] = { "<cmd> MarkdownPreviewToggle <cr>", "Markdown Preview toggle" },
  },
}

return M
