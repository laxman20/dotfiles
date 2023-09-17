return {
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
	{'christoomey/vim-tmux-navigator',
		enabled = function()
			return vim.fn.executable('tmux') == 1
		end
	},
	'editorconfig/editorconfig-vim',
	'tpope/vim-surround',
	'tpope/vim-commentary',
	'tpope/vim-unimpaired',
	'tpope/vim-repeat',
	'tpope/vim-fugitive',
	'neovim/nvim-lsp',
	'mfussenegger/nvim-jdtls',
	'tommcdo/vim-lion',
	'Vimjas/vim-python-pep8-indent',
	'vim-test/vim-test',
	{'ibhagwan/fzf-lua',
		enabled = function()
			return vim.fn.executable('fzf') == 1 and vim.fn.has('win32') == 0
		end
	},
	{'vijaymarupudi/nvim-fzf', lazy = true},
	{'kyazdani42/nvim-web-devicons', lazy = true},
	{'gbprod/substitute.nvim',
		config = function()
			require("substitute").setup({})
			vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
			vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
			vim.keymap.set("n", "S", require('substitute').eol, { noremap = true })
			vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })
		end,
	},
	{'Lilja/zellij.nvim', 
		enabled = function()
			return vim.fn.executable('zellij') == 1
		end,
		config = function()
			require("zellij").setup({})
			vim.keymap.set('n', '<A-h>', "<cmd>ZellijNavigateLeft<cr>")
			vim.keymap.set('n', '<A-j>', "<cmd>ZellijNavigateDown<cr>")
			vim.keymap.set('n', '<A-k>', "<cmd>ZellijNavigateUp<cr>")
			vim.keymap.set('n', '<A-l>', "<cmd>ZellijNavigateRight<cr>")
		end,
	},
	{'williamboman/mason.nvim', config = true},

}
