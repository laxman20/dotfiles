return {
	'NoahTheDuke/vim-just',
	'tpope/vim-surround',
	'tpope/vim-unimpaired',
	'tpope/vim-repeat',
	'tpope/vim-sleuth',
	'mfussenegger/nvim-jdtls',
	'tommcdo/vim-lion',
	'Vimjas/vim-python-pep8-indent',
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
	{ 'jamestthompson3/nvim-remote-containers' },
	{ 'kevinhwang91/nvim-bqf' }
}
