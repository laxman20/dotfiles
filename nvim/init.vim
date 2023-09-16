
inoremap jk <Esc>
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>
inoremap <C-f> <C-x><C-f>


nnoremap gV ggVG


tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<CR>
tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<CR>
tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<CR>

nnoremap <Space>f <cmd>lua require('fzf-lua').files()<CR>
nnoremap <Space>g <cmd>lua require('fzf-lua').grep()<CR>
nnoremap <Space>G <cmd>lua require('fzf-lua').live_grep()<CR>

tnoremap jk <C-\><C-n>
nnoremap <Space>tt :T !!<CR>
nnoremap <Space>tl :Tclear<CR>
let g:neoterm_autoscroll = 1

command! FiletypeSettings if &filetype != ""
			\|  execute 'vsplit ~/.config/nvim/after/ftplugin/' . &filetype . '.vim'
			\| endif

command! Snippets edit ~/.config/nvim/lua/snippets-config/init.lua


augroup commands
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
	autocmd BufEnter term://* startinsert

	au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
augroup END

let g:diagnostic_insert_delay = 1

lua <<EOF
-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system { 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
'NoahTheDuke/vim-just',
{ 'navarasu/onedark.nvim', 
	lazy = false,
	config = function(_, opts)
		require("onedark").setup(opts)
		require'onedark'.load()
	end,
	opts = {
		style = "warmer"
	}
	},
'christoomey/vim-tmux-navigator',
'editorconfig/editorconfig-vim',
'tpope/vim-surround',
'tpope/vim-commentary',
'tpope/vim-unimpaired',
'tpope/vim-repeat',
'tpope/vim-fugitive',
'tpope/vim-projectionist',
'neovim/nvim-lsp',
'hauleth/asyncdo.vim',
'kassio/neoterm',
'mfussenegger/nvim-jdtls',
{'stevearc/oil.nvim', opts = {}},
'tommcdo/vim-lion',
'sainnhe/sonokai',
'Vimjas/vim-python-pep8-indent',

'vim-test/vim-test',

'ibhagwan/fzf-lua',
'vijaymarupudi/nvim-fzf',
'kyazdani42/nvim-web-devicons',

'sbdchd/neoformat',

{'gbprod/substitute.nvim', opts = {}},
{'Lilja/zellij.nvim', opts = {}},

{'williamboman/mason.nvim', opts = {}},

{'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function(_, opts) 
		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)
	end,
	opts = {
		ensure_installed = {"norg", "json", "java", "lua", "vim"},     -- one of "all", "language", or a list of languages
		highlight = {
			enable = true
		},
		indent = {
			enable = true
		},
	}
},
{ 'nvim-neorg/neorg',
	build = ':Neorg sync-parsers',
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Neorg",
	ft = "norg",
	opts = {
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {
				config = {
					icon_preset = "diamond"
				} -- Adds pretty icons to your documents
			},
			["core.dirman"] = { -- Manages Neorg workspaces
			config = {
				workspaces = {
					notes = "~/norg",
				},
				default_workspace = "notes"
			},
			},
			["core.itero"] = {},
			["core.promo"] = {},
			["core.summary"] = {},
			["core.export"] = {},
			["core.completion"] = {
				config  = {
					engine = "nvim-cmp"
				},
			},
		},
	}
},
{ "hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip"
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' }, -- For luasnip users.
				{ name = 'neorg' },
			}, {
				{ name = 'buffer' },
			})
		})
	end
}
}, {})

vim.wo.number = true
vim.o.hidden = true
vim.o.incsearch = true
vim.o.inccommand = 'nosplit'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.tagcase = 'smart'
vim.o.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noselect'

vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })

vim.keymap.set('n', '<A-h>', "<cmd>ZellijNavigateLeft<cr>")
vim.keymap.set('n', '<A-j>', "<cmd>ZellijNavigateDown<cr>")
vim.keymap.set('n', '<A-k>', "<cmd>ZellijNavigateUp<cr>")
vim.keymap.set('n', '<A-l>', "<cmd>ZellijNavigateRight<cr>")

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require("lsp")
EOF

command! Ghistory Glog -- %

let g:fugitive_domain_pattern = 'engstash.int.kronos.com'

if has('termguicolors')
	set termguicolors
endif

let g:neoformat_try_node_exe = 1

