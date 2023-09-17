return { 'nvim-neorg/neorg',
	build = ':Neorg sync-parsers',
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Neorg",
	ft = "norg",
	opts = {
		load = {
		["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {
				config = {
					icon_preset = "diamond"
				} -- Adds pretty icons to your documents
			},
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = "~/norg",
					},
					default_workspace = "notes"
				},
			},
			["core.itero"] = {},
			["core.promo"] = {},
			["core.summary"] = {},
			["core.export"] = {},
			["core.completion"] = {
				config  = {
					engine = "nvim-cmp"
				},
			},
		},
	}
}
