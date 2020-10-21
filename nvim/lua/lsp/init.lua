local nvim_lsp = require'nvim_lsp'

local mapper = function(mode, key, result)
  vim.fn.nvim_buf_set_keymap(0, mode, key, result, { noremap = true, silent = true })
end

local on_attach = function()
  print('Starting LSP Server')
  mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  mapper('n', '<space>cr', '<cmd>lua vim.lsp.buf.rename()<CR>')
  mapper('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

  vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

  mapper('n', ']g', '<cmd>NextDiagnostic<CR>')
  mapper('n', '[g', '<cmd>PrevDiagnostic<CR>')

  -- causing freezes on startup using jdtls -- require'diagnostic'.on_attach()
end

nvim_lsp.bashls.setup{ on_attach=on_attach }
nvim_lsp.tsserver.setup{ on_attach=on_attach }
nvim_lsp.yamlls.setup{ on_attach=on_attach }
nvim_lsp.pyls.setup{ on_attach=on_attach }

function setup_java()
  local jdtls = require 'jdtls'
  jdtls.start_or_attach({
    cmd={'java-lsp'};
    on_attach=on_attach;
    init_options={
      extendedClientCapabilities={
        classFileContentsSupport = true
      }
    }
  })
end

vim.api.nvim_command('augroup lsp')
vim.api.nvim_command('au!')
vim.api.nvim_command("au FileType java lua setup_java()")
vim.api.nvim_command('augroup END')
