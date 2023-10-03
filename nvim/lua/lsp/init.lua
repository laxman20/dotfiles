local M = {}
local nvim_lsp = require'lspconfig'

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, { noremap = true, silent = true })
end

local on_attach = function()
  print('Starting LSP Server')
  mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  mapper('n', '<space>cr', '<cmd>lua vim.lsp.buf.rename()<CR>')
  -- mapper('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  mapper('n', '<M-CR>', "<cmd>lua require('fzf-lua').lsp_code_actions()<CR>")
  mapper('n', '<space>o', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

  vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

  mapper('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  mapper('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

end

nvim_lsp.bashls.setup{ on_attach=on_attach, capabilities=capabilities }
nvim_lsp.tsserver.setup{ on_attach=on_attach, capabilities=capabilities }
nvim_lsp.angularls.setup{ on_attach=on_attach, capabilities=capabilities }

local project_library_path = "./node_nodules"
local cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}

nvim_lsp.angularls.setup{
  on_attach=on_attach,
  capabilities=capabilities,
  cmd = cmd,
  on_new_config = function(new_config,new_root_dir)
    new_config.cmd = cmd
  end,
}
nvim_lsp.pyright.setup{ 
  on_attach=on_attach,
  capabilities=capabilities,
  -- before_init = function(_, config)
  --   config.settings.python.pythonPath = 'docker/2.7/.venv/bin/python'
  -- end
}

function setup_java()
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  local workspace_dir = '/Users/laxmanso/.local/share/workspace/' .. project_name

  local jdtls = require 'jdtls'
  -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
  local config = {
    -- The command that starts the language server
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {

      -- 💀
      '/Users/laxmanso/.jenv/versions/openjdk64-18.0.1.1/bin/java', -- or '/path/to/java17_or_newer/bin/java'
      -- depends on if `java` is in your $PATH env variable and if it points to the right version.

      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

      -- 💀
      '-jar', vim.fn.glob('/Users/laxmanso/.local/jdt-language-server-1.12.0/plugins/org.eclipse.equinox.launcher_*.jar'),
      -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
      -- Must point to the                                                     Change this to
      -- eclipse.jdt.ls installation                                           the actual version


      -- 💀
      '-configuration', '/Users/laxmanso/.local/jdt-language-server-1.12.0/config_mac',
      -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
      -- Must point to the                      Change to one of `linux`, `win` or `mac`
      -- eclipse.jdt.ls installation            Depending on your system.


      -- 💀
      -- See `data directory configuration` section in the README
      '-data', workspace_dir
    },

    -- 💀
    -- This is the default if not provided, you can remove it. Or adjust as needed.
    -- One dedicated LSP server & client will be started per unique root_dir
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
      java = {
        configuration = {
          {
            name = "JavaSE_1_8",
            path = "/Users/laxmanso/Library/Java/JavaVirtualMachines/corretto-1.8.0_322/Contents/Home",
          },
        }
      }
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
      bundles = {}
    },
    on_init = function(client)
      client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
    end,

    on_attach = function()
      on_attach()
      mapper('n', '<A-o>', '<cmd>lua require"jdtls".organize_imports()<CR>')
    end,
    capabilities=capabilities
  }
  -- This starts a new client & server,
  -- or attaches to an existing client & server depending on the `root_dir`.
  require('jdtls').start_or_attach(config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  underline = true,
  signs = true,
}
)

M.setup_java = setup_java
return M
