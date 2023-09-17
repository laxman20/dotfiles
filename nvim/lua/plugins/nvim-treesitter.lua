return {'nvim-treesitter/nvim-treesitter',
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
}
