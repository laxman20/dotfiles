return 
	-- {
	-- 	'navarasu/onedark.nvim', 
	-- 	lazy = false,
	-- 	config = function(_, opts)
	-- 		require("onedark").setup(opts)
	-- 		require'onedark'.load()
	-- 	end,
	-- 	opts = {
	-- 		style = "warmer"
	-- 	}
	-- },
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd("colorscheme nightfox")
		end
	}
