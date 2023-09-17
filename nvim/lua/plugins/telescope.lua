return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
	},
	cmd = "Telescope",
	keys = {
		{ "<Space>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>"},
		{ "<Space>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>"},

	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({})
		telescope.load_extension("fzf")
	end
}
