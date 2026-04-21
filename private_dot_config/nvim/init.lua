vim.pack.add({
	'https://github.com/stevearc/oil.nvim',
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	'https://github.com/obsidian-nvim/obsidian.nvim',
	'https://github.com/nvim-mini/mini.nvim',
	{ src='https://github.com/saghen/blink.cmp', version = vim.version.range("1.*")},
	'https://github.com/neovim/nvim-lspconfig'
	
})

require('mini.icons').setup()
require('mini.pick').setup()
require('mini.pairs').setup()
require('mini.jump').setup()
require('mini.jump2d').setup({
	mappings = {
		start_jumping = 'S'
	}
})
require('mini.surround').setup({
	mappings = {
		add = 'ys',
		delete = 'ds',
		find = '',
		find_left = '',
		highlight = '',
		replace = 'cs',

		-- Add this only if you don't want to use extended mappings
		suffix_last = '',
		suffix_next = '',
	},
	search_method = 'cover_or_next',
})

require('blink.cmp').setup({
	keymap = {
		preset = 'enter'
	}
})

require("oil").setup()
require('nvim-treesitter').install { 'markdown', 'markdown_inline' }
require('obsidian').setup({
	legacy_commands = false,
	checkbox = {
		enabled = true,
		create_new = false,
		order = { " ", "x" }
	},
	workspaces = {{
		name =  "personal",
		path = "~/wiki"
	}},
	callbacks = {
		enter_note = function(note)
			vim.keymap.set("n", "<C-space>", "<cmd>Obsidian toggle_checkbox<cr>", {
				buffer = true,
				desc = "Toggle checkbox",
			})
		end,
	},
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<space>ff", function() MiniPick.builtin.files() end)
vim.keymap.set("n", "<space>fg", function() MiniPick.builtin.grep_live() end)
vim.keymap.set("n", "<space>fc", function() MiniPick.builtin.files({}, { source = { cwd = "~/.config/nvim" } }) end)

vim.opt.conceallevel = 2

