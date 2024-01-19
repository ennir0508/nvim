# Trouble Shooting

## HealthCheck

```log
==============================================================================
lazy: require("lazy.health").check()

lazy.nvim ~
- OK Git installedC:\Users\ebikatsu\.config\nvim
- OK no existing packages found by other package managers
- OK packer_compiled.lua not found
- WARNING {nvim-lspconfig}: overriding <config>
```

```log
==============================================================================
nvim-treesitter: require("nvim-treesitter.health").check()

Installation ~
- OK `tree-sitter` found 0.20.8 (0c49d6745b3fc4822ab02e0018770cd6383a779c) (parser generator, only needed for :TSInstallFromGrammar)
- OK `node` found v20.5.0 (only needed for :TSInstallFromGrammar)
- OK `git` executable found.
- OK `gcc` executable found. Selected from { vim.NIL, "cc", "gcc", "clang", "cl", "zig" }
  Version: gcc (GCC) 11.2.0
- OK Neovim was compiled with tree-sitter runtime ABI version 14 (required >=13). Parsers must be compatible with runtime ABI.

OS Info:
{
  machine = "x86_64",
  release = "10.0.22621",
  sysname = "Windows_NT",
  version = "Windows 11 Pro"
} ~

Parser/Features         H L F I J
  - c                   ✓ ✓ ✓ ✓ ✓
  - css                 ✓ . ✓ ✓ ✓
  - html                ✓ ✓ ✓ ✓ ✓
  - javascript          ✓ ✓ ✓ ✓ ✓
  - lua                 ✓ ✓ ✓ ✓ ✓
  - markdown            ✓ . ✓ ✓ ✓
  - markdown_inline     ✓ . . . ✓
  - tsx                 ✓ ✓ ✓ ✓ ✓
  - typescript          ✓ ✓ ✓ ✓ ✓
  - vim                 ✓ ✓ ✓ . ✓

  Legend: H[ighlight], L[ocals], F[olds], I[ndents], In[j]ections
         +) multiple parsers found, only one will be used
         x) errors found in the query, try to run :TSUpdate {lang} ~
```

```log
==============================================================================
provider: health#provider#check

Clipboard (optional) ~
- OK Clipboard tool found: win32yank

Python 3 provider (optional) ~
- Disabled (g:loaded_python3_provider=0).

Python virtualenv ~
- OK no $VIRTUAL_ENV

Ruby provider (optional) ~
- Disabled (g:loaded_ruby_provider=0).

Node.js provider (optional) ~
- Disabled (g:loaded_node_provider=0).

Perl provider (optional) ~
- Disabled (g:loaded_perl_provider=0).
```

```log
==============================================================================
which-key: require("which-key.health").check()

WhichKey: checking conflicting keymaps ~
- WARNING conflicting keymap exists for mode **"n"**, lhs: **"gb"**
- rhs: ` `
- WARNING conflicting keymap exists for mode **"n"**, lhs: **"gc"**
- rhs: ` `
```

### FIX: which-key: require("which-key.health").check()

The visual mode key maps "gc", "gb" in plugins/init.lua merge to normal mode's.

```vim
{
  "numToStr/Comment.nvim",
  keys = {
    { "gc", mode = { "n", "o", "x" }, desc = "Comment toggle linewise" },
    { "gb", mode = { "n", "o", "x" }, desc = "Comment toggle blockwise" },
  },
}
```

## Rust LSP

### FIX: proc macro `command` not expanded: cannot find proc-macro-srv, the workspace ... is missing a sysroot [unresolved-proc-macro]

This is caused by rust-analyzer. The configuration ignore.

```vim
lspconfig.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        disabled = { "unresolved-proc-macro" },
      },
    },
  },
}
```
