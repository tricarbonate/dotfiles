-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- local null_ls = require("null-ls")

-- null_ls.setup({
--   sources = {
--     null_ls.builtins.formatting.autopep8,
--     null_ls.builtins.formatting.black,
--     null_ls.builtins.formatting.isort,
--   },
--   -- you can configure null-ls to run on save
--   on_attach = function(client)
--     if client.resolved_capabilities.document_formatting then
--       vim.cmd([[augroup Format]])
--       vim.cmd([[autocmd! * <buffer>]])
--       vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = true })]])
--       vim.cmd([[augroup END]])
--     end
--   end,
-- })
