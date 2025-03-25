return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = {
		previewers = {
			builtin = {
				title_fnamemodify = function(s)
					if #s > 80 then
						return "..." .. string.sub(s, -80)
					else
						return s
					end
				end,
			},
		},
		files = {
			formatter = "path.filename_first"
		},
		live_grep = {
			formatter = "path.filename_first" 
		}
	},
	cmd = "FzfLua",
	keys = {
		{ "<Space>ff", "<cmd>lua require('fzf-lua').files()<cr>" },
		{ "<Space>fc", "<cmd>lua require('fzf-lua').files({cwd = '~/.config/nvim/'})<cr>"},
		{ "<Space>fg", "<cmd>lua require('fzf-lua').live_grep()<cr>"},
	}
	-- "nvim-telescope/telescope.nvim",
	-- dependencies = {
	-- 	"nvim-lua/plenary.nvim",
	-- 	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
	-- },
	-- cmd = "Telescope",
	-- keys = {
	-- 	{ "<Space>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>"},
	-- 	{ "<Space>fn", "<cmd>lua require('telescope.builtin').find_files({cwd = '~/norg/'})<cr>"},
	-- 	{ "<Space>fc", "<cmd>lua require('telescope.builtin').find_files({cwd = '~/.config/nvim/'})<cr>"},
	-- 	{ "<Space>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>"},
	--
	-- },
	-- config = function()
	-- 	local telescope = require("telescope")
	-- 	local actions = require("telescope.actions")
	-- 	telescope.setup({
	-- 		defaults = {
	-- 			wrap_results = true,
	-- 			mappings = {
	-- 				i = {
	-- 					["<esc>"] = actions.close,
	-- 					["<C-u>"] = false,
	-- 				}
	-- 			}
	-- 		}
	-- 	})
	-- 	telescope.load_extension("fzf")
	-- end
}
