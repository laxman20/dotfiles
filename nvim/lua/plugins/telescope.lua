return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
	},
	cmd = "Telescope",
	keys = {
		{ "<Space>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>"},
		{ "<Space>fn", "<cmd>lua require('telescope.builtin').find_files({cwd = '~/norg/'})<cr>"},
		{ "<Space>fc", "<cmd>lua require('telescope.builtin').find_files({cwd = '~/.config/nvim/'})<cr>"},
		{ "<Space>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>"},

	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<C-u>"] = false,
					}
				}
			}
		})
		telescope.load_extension("fzf")
	end
}
