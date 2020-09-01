local on_attach = function()

  vim.api.nvim_buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap('n', '<Space>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { noremap = true, silent = true })

  require'diagnostic'.on_attach()
end

require'nvim_lsp'.bashls.setup{ on_attach=on_attach }
