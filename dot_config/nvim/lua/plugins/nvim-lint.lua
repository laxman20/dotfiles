return { "mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			sh = { "shellcheck" }
		}
	end,
	init = function()
		vim.api.nvim_create_user_command(
			'Lint',
			function(opts)
				require("lint").try_lint()
			end,
			{}
		)
	end
}
