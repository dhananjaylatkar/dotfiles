-- Dashboard
local db = require("dashboard")

db.custom_header = CONFIG.dashboard.custom_header

db.custom_center = {
	{
		icon = "ﭯ  ",
		desc = "Recent Files         ",
		shortcut = "SPC r f",
		action = "Telescope oldfiles",
	},
	{
		icon = "  ",
		desc = "Open Project         ",
		shortcut = "SPC p p",
		action = "Telescope project",
	},
	{
		icon = "  ",
		desc = "Find File            ",
		shortcut = "SPC f f",
		action = "Telescope find_files hidden=true)",
	},
	{
		icon = "  ",
		desc = "Find Word            ",
		shortcut = "SPC s p",
		action = "Telescope live_grep",
	},
	{
		icon = "  ",
		desc = "Settings                  ",
		shortcut = ".",
		action = ":e ~/.config/nvim/lua/" .. CONFIG_FILE,
	},
}

db.custom_footer = CONFIG.dashboard.custom_footer
