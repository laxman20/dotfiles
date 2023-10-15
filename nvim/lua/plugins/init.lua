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
	'tpope/vim-surround',
	'tpope/vim-unimpaired',
	'tpope/vim-repeat',
	'tpope/vim-fugitive',
	'tpope/vim-sleuth',
	{ 'tommcdo/vim-fubitive',
		init = function()
			vim.g.fubitive_domain_pattern = 'engstash.int.kronos.com'
		end,
	},
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
	{ 'wellle/targets.vim' },
}
