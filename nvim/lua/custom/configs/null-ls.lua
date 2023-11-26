-- Install a variety of tools for null_ls.
--
-- Additionally, we set up the following fucntionalities:
-- 1) Upon saving a file, the file formats given some formatter.

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')
local fmt = null_ls.builtins.formatting
local diag = null_ls.builtins.diagnostics

local opts = {
  sources = {
        diag.mypy,
        diag.pylint.with({
            extra_args = {
                "-rn"  -- Only display messages
            }
        }),
        diag.yamllint,
        fmt.autoflake.with({
            extra_args = {
                "--in-place",
                "--remove-unused-variables",
                "--remove-all-unused-imports",
                "--ignore-init-module-imports"
            }
        }),
        fmt.black,
        fmt.isort,
        fmt.yamlfix
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
}

return opts
