local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "diagnosticls",
  "docker_compose_language_service",
  "dockerls",
  -- "efm",
  "jsonls",
  "jdtls",
  "powershell_es",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- Language Servers Configrations for each languages.
--
-- Available Language List:
--     https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--

-- Angular: a JavaScript framework for building web applications with structured, maintainable code.
-- lspconfig.angularls.setup {}

-- Ansible: an open-source automation tool for configuration management and application deployment.
-- lspconfig.ansiblels.setup {}

-- Astro: a static site generator for faster, modern web development.
-- lspconfig.astro.setup {}

-- AWK: a versatile text processing tool in Unix-like systems.
-- lspconfig.awk_ls.setup {}

-- Bash: a Unix shell and command language for scripting tasks.
lspconfig.bashls.setup {}

-- CSS (Cascading Style Sheets): it is used for web page styling.
--     Already added as default
-- lspconfig.cssls.setup {}

-- CSS Modules: it provides local scope for CSS styles in web development.
lspconfig.cssmodules_ls.setup {}

-- Custom Elements: it allows creation of new HTML tags in web development.
lspconfig.custom_elements_ls.setup {
  filetypes = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "jsx", "tsx", "vue" },
}

-- Dart: a programming language for web and app development.
-- lspconfig.dartls.setup {}

-- Diagnostics refer to the identification and analysis of issues or problems.
--     Already added as default
-- lspconfig.diagnosticls.setup {}

-- Docker Compose: Docker container configuration.
--     Already added as default
lspconfig.docker_compose_language_service.setup {}

-- Docker: Platform for containerizing and deploying applications easily.
--     Already added as default
lspconfig.dockerls.setup {}

-- EFM (EditorConfig Format Manager): it manages code formatting in text editors.
--     Already added as default
-- lspconfig.efm.setup {}

-- Emmet: a web development toolkit for quickly generating HTML/CSS code.

-- ESLint: a static code analysis tool for identifying JavaScript errors.
-- lspconfig.eslint.setup {
--   --- ...
--   on_attach = function(client, bufnr)
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = bufnr,
--       command = "EslintFixAll",
--     })
--   end,
-- }

-- Gradle: a build automation tool for building software projects.
lspconfig.gradle_ls.setup {}

-- GraphQL: a query language for APIs, enabling more efficient data retrieval.
-- lspconfig.graphql.setup {}

-- Groovy: a dynamic, object-oriented programming language for the Java platform.
-- lspconfig.groovyls.setup {}

-- Haskell: a functional programming language known for strong type systems.
-- lspconfig.hls.setup {}

-- Java: a popular, versatile, and platform-independent programming language.
lspconfig.jdtls.setup {}

-- JSON (JavaScript Object Notation): a lightweight data interchange format.
--     Already added as default
-- lspconfig.jsonls.setup {}

-- Kotlin: a modern, statically-typed programming language for the JVM.
-- lspconfig.kotlin_language_server.setup {}

-- Lua: a lightweight, embeddable scripting language often used in games.
--     Already added as default
-- lspconfig.lua_ls.setup {}

-- Powershell: a powershell and command language for scripting tasks.
--     Already added as default
lspconfig.powershell_es.setup {}

-- Python: a versatile, high-level programming language known for readability.
-- lspconfig.pyright.setup {}

-- Ruby: a dynamic, object-oriented programming language known for its simplicity.
-- lspconfig.ruby_ls.setup {}
-- lspconfig.rubocop.setup {}

-- Rust: a systems programming language focused on safety and performance.
-- lspconfig.rust_analyzer.setup {}

-- SQL (Structured Query Language) is used to manage and query databases.
lspconfig.sqlls.setup {}

-- Svelte: a JavaScript framework for building web applications with a focus on efficient, compiled code and minimal runtime overhead.
-- lspconfig.svelte.setup {}

-- Tailwind CSS: a utility-first CSS framework for building responsive web designs quickly by applying pre-defined classes to HTML elements.
lspconfig.tailwindcss.setup {}

-- Vue.js: a progressive JavaScript framework for building web applications.
-- lspconfig.vuels.setup {}

-- YAML (YAML Ain't Markup Language): a human-readable data serialization format.
--     Already added as default
-- lspconfig.yamlls.setup {}
