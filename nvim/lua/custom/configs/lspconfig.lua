local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

-- PYRIGHT installation
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes= {"python"},
  settings = {
    pyright = {
      analysis = {
        disableOrganizeImports = true,
        autoImportCompletions = true,
      }
    }
  }
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"yaml", "yml"},
  settings = {
        yaml = {
            completion = true,
            validate = true,
            format = {
                printWidth = 4,
                bracketSpacing = true,
                enable = true,
            }
        }
    }
})

