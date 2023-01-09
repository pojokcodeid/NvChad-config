-- more space in the neovim command line for displaying messages
-- use this function notation to build some variables
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

local function capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return capabilities
end

local function directory_exists(path)
  local f = io.popen("cd " .. path)
  local ff = f:read "*all"

  if ff:find "ItemNotFoundException" then
    return false
  else
    return true
  end
end

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- pastikan sudah config java home
-- echo export JAVA_HOME='$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")' | sudo tee /etc/profile.d/jdk_home.sh > /dev/null
-- echo $JAVA_HOME

local java_home = os.getenv "JAVA_HOME"
if directory_exists(java_home) then
else
  print "java_home Not Exists"
end

-- calculate workspace dir
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
if directory_exists(workspace_dir) then
else
  os.execute("mkdir " .. workspace_dir)
end
-- get the mason install path
local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
local bundles = {}
local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
-- get the current OS
local os
if vim.fn.has "macunix" then
  os = "mac"
elseif vim.fn.has "win32" then
  os = "win"
else
  os = "linux"
end

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. install_path .. "/lombok.jar",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    install_path .. "/config_" .. os,
    "-data",
    workspace_dir,
  },
  capabilities = capabilities(),
  root_dir = root_dir,
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-17",
            path = java_home, --sesuaikan dengan java home osnya
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
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = {
        enabled = false,
        -- settings = {
        --   profile = "asdf"
        -- }
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
    },
    contentProvider = { preferred = "fernflower" },
    extendedClientCapabilities = extendedClientCapabilities,
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
    -- bundles = {},
    bundles = bundles,
  },
}

config["on_attach"] = function(client, bufnr)
  local _, _ = pcall(vim.lsp.codelens.refresh)
  require("lvim.lsp").common_on_attach(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    if desc then
      desc = desc
    end

    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
  end
  map("n", "<leader>Co", jdtls.organize_imports, "Organize Imports")
  map("n", "<leader>Cv", jdtls.extract_variable, "Extract Variable")
  map("n", "<leader>Cc", jdtls.extract_constant, "Extract Constant")
  map("n", "<leader>Ct", jdtls.test_nearest_method, "Test Method")
  map("n", "<leader>CT", jdtls.test_class, "Test Class")
  map("n", "<leader>Cu", "<Cmd>JdtUpdateConfig<CR>", "Update Config")
  map("v", "<leader>Cv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable")
  map("v", "<leader>Cc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant")
  map("v", "<leader>Cm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method")
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})

jdtls.start_or_attach(config)

vim.cmd [[command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)]]
