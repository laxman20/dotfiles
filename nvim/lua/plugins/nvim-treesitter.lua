return {'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	event = { "VeryLazy", },
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects", },
	},
	cmd = { "TSUpdateSync" },
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
		textobjects = {
			move = {
				enable = true,
				goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
				goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
				goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
				goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
			},
		},
	},
}
