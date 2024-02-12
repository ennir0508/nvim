local options = {
  auto_install = true,
  ensure_installed = {
    "lua",
    "vim",
    "toml",
    "css",
    "tsx",
    "css",
    "html",
    "lua",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  autotag = {
    enable = true,
    filetypes = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "css",
      "lua",
      "xml",
      "markdown",
    },
  },
  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
