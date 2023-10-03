return { "stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			java = { "google-java-format" },
			sh = { "shellcheck" },
		},
	},
	init = function()
		vim.api.nvim_create_user_command(
			'Format',
			function(opts)
				require("conform").format()
			end,
			{}
		)
	end
}
