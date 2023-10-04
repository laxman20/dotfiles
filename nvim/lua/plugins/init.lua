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
		end,
		config = function()
			vim.keymap.set("t", "<C-j>", "<cmd><C-\\><C-n>:TmuxNavigateDown<cr>", { noremap = true, silent = true })
			vim.keymap.set("t", "<C-k>", "<cmd><C-\\><C-n>:TmuxNavigateUp<cr>", { noremap = true, silent = true })
			vim.keymap.set("t", "<C-h>", "<cmd><C-\\><C-n>:TmuxNavigateLeft<cr>", { noremap = true, silent = true })
			vim.keymap.set("t", "<C-l>", "<cmd><C-\\><C-n>:TmuxNavigateRight<cr>", { noremap = true, silent = true })
		end,
	},
	'editorconfig/editorconfig-vim',
	'tpope/vim-surround',
	'tpope/vim-unimpaired',
	'tpope/vim-repeat',
	'tpope/vim-fugitive',
	{ 'tommcdo/vim-fubitive',
		init = function()
			vim.g.fubitive_domain_pattern = 'engstash.int.kronos.com'
		end,
	},
	'neovim/nvim-lsp',
	'mfussenegger/nvim-jdtls',
	'tommcdo/vim-lion',
	'Vimjas/vim-python-pep8-indent',
	'vim-test/vim-test',
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
	{ 'wellle/targets.vim' },
}
