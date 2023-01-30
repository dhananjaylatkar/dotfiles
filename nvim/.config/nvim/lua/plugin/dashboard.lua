-- Dashboard config

require("dashboard").setup({
	theme = "hyper",
	config = {
		header = CONFIG.dashboard.custom_header,
		footer = CONFIG.dashboard.custom_footer,
		project = { limit = 5, action = 'Telescope find_files hidden=true cwd='},
		mru = { limit = 5},
		-- week_header = {
		-- 	enable = true,
		-- },
		shortcut = {
			{
				desc = " Recents",
				group = "String",
				action = "Telescope oldfiles",
				key = "1",
			},
			{
				desc = " Files",
				group = "Label",
				action = "Telescope find_files hidden=true",
				key = "2",
			},
			{
				desc = " Project",
				group = "DiagnosticHint",
				action = "Telescope project",
				key = "3",
			},
			{
				desc = " Grep",
				group = "Number",
				action = "Telescope live_grep",
				key = "4",
			},
		},
	},
})
