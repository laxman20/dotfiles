return { 
	-- 'nvim-neorg/neorg',
	-- build = ':Neorg sync-parsers',
	-- dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope",
	-- 	{
	-- 		"vhyrro/luarocks.nvim",
	-- 		priority = 1000,
	-- 		config = true
	-- } },
	-- cmd = "Neorg",
	-- ft = "norg",
	-- opts = {
	-- 	load = {
	-- 	["core.defaults"] = {}, -- Loads default behaviour
	-- 		["core.concealer"] = {
	-- 			config = {
	-- 				icon_preset = "diamond"
	-- 			} -- Adds pretty icons to your documents
	-- 		},
	-- 		["core.dirman"] = { -- Manages Neorg workspaces
	-- 			config = {
	-- 				workspaces = {
	-- 					notes = "~/norg",
	-- 				},
	-- 				default_workspace = "notes"
	-- 			},
	-- 		},
	-- 		["core.esupports.metagen"] = {
	-- 			config = {
	-- 				type = "auto",
	-- 			},
	-- 		},
	-- 		["core.itero"] = {},
	-- 		["core.promo"] = {},
	-- 		["core.summary"] = {},
	-- 		["core.export"] = {},
	-- 		["core.completion"] = {
	-- 			config  = {
	-- 				engine = "nvim-cmp"
	-- 			},
	-- 		},
	-- 		["core.integrations.telescope"] = {},
	-- 	},
	-- },
	-- init = function()
	-- 	local neorg_callbacks = require("neorg.core.callbacks")
	--
	-- 	neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
	-- 		keybinds.map_event_to_mode("norg", {
	-- 			i = {
	-- 				{ "<C-l>", "core.integrations.telescope.insert_link" },
	-- 			},
	-- 			}, {
	-- 				silent = true,
	-- 				noremap = true,
	-- 		})
	-- 	end)
	-- end
}
