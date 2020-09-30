local mapper = function(mode, key, result)
  vim.fn.nvim_buf_set_keymap(0, mode, key, result, { noremap = true, silent = true })
end

local on_attach = function()
  print('Starting LSP Server')
  -- mapper('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  -- mapper('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  -- mapper('n', '<space>cr', '<cmd>lua vim.lsp.buf.rename()<CR>')

  vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

  mapper('n', ']g', '<cmd>NextDiagnostic<CR>')
  mapper('n', '[g', '<cmd>PrevDiagnostic<CR>')

  require'diagnostic'.on_attach()
end

require'nvim_lsp'.bashls.setup{ on_attach=on_attach }
require'nvim_lsp'.tsserver.setup{ on_attach=on_attach }
require'nvim_lsp'.yamlls.setup{ on_attach=on_attach }
-- require'nvim_lsp'.jdtls.setup{ on_attach=on_attach }

