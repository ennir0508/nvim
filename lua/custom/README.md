# Example_config

This can be used as an example custom config for NvChad. Do check the
https://github.com/NvChad/nvcommunity

## Features

- use pwsh
- format on save
- file seting(newline, utf8, swap, e.t.c.)
- map
- \[solution\] for nvim-web-devicons
  - change font in Powershell
  - use this one.
    [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip)
- Plugins
  - rcarriga/nvim-notify
  - nvim-pack/nvim-spectre
  - folke/trouble.nvim
  - folke/todo-comments.nvim
  - git-blame that shows who edit latest like git-lens.
    - Gitsign
  - makrdown/markdown-preview
- LSP
  - markdown
    - auto indent for list
  - java
    - for spring boot
    - jdtls
  - docker/docker-compose

## Plugins

- first

## LSP

- first

### Features to be added in the future

- solution for fzf error

  ```log
  Failed to run `config` for telescope.nvim

  ...a/lazy/telescope.nvim/lua/telescope/_extensions/init.lua:10: 'fzf' extension doesn't exist or isn't installed: ...nvim-data/lazy/telescope-fzf-native.nvim/lua/fzf_lib.lua:11: cannot load module 'C:/Users/ebikatsu/AppData/Local/nvim-data/lazy/telescope-fzf-native.nvim/lua/../build/libfzf.dll': 指定されたモジュールが見つかりません。^M


  # stacktrace:
    - telescope.nvim\lua\telescope\_extensions\init.lua:10 _in_ **load_extension**
    - telescope.nvim\lua\telescope\_extensions\init.lua:62 _in_ **load_extension**
    - lua/plugins/init.lua:247 _in_ **config**
  ```

- Plugins
  - dap
    - https://github.com/mfussenegger/nvim-jdtls
  - nvim-bqf \* consideration needed
  - diffview
  - copilot
  - emmit for tsx
- LSP
  - sql
  - shell
