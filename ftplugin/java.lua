-- Java Language Server configuration.
local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
  vim.notify "JDTLS not found, install with `:LspInstall jdtls`"
  return
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local mason_path = vim.fn.stdpath "data" .. "/mason/"
local mason_package_path = mason_path .. "packages/"

-- Java Language Server
local jdtls_path = mason_package_path .. "jdtls/"
local path_to_lsp_server = jdtls_path .. "config_win"
local path_to_jar = jdtls_path .. "plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar"
local lombok_path = jdtls_path .. "lombok.jar"

-- Java Debuger
local path_to_java_dap = mason_package_path .. "java-debug-adapter/extension/server/"
local path_to_java_test_dap = mason_package_path .. "java-test/extension/server/"

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
os.execute("mkdir " .. workspace_dir)

-- This bundles definition is the same as in the previous section (java-debug installation)
local bundles = {
  vim.fn.glob(path_to_java_dap .. "com.microsoft.java.debug.plugin-*.jar", 1),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(path_to_java_test_dap .. "*.jar", 1), "\n"))

-- Main Config
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    os.getenv "JAVA_HOME" .. "/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. lombok_path,
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    path_to_jar,
    "-configuration",
    path_to_lsp_server,
    "-data",
    workspace_dir,
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      home = os.getenv "JAVA_HOME",
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-17",
            path = os.getenv "JAVA_HOME",
          },
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
        settings = {
          url = vim.fn.stdpath "config" .. "/rule/eclipse-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org",
      },
    },
    -- extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },

  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = bundles,
  },

  on_attach = function(_, bufnr)
    require("keymaps").map_java_keys(bufnr)
    require("lsp_signature").on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      floating_window_above_cur_line = false,
      padding = "",
      handler_opts = {
        border = "rounded",
      },
    }, bufnr)
    jdtls.setup_dap { hotcodereplace = "auto" }
  end,
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)
