-- Dashboard
vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_section = {
	a = {
		description = { "ﭯ  Recent Files         SPC r f" },
		command = "Telescope oldfiles",
	},
	b = {
		description = { "  Open Project         SPC p p" },
		command = "Telescope project",
	},
	c = {
		description = { "  Find File            SPC f f" },
		command = "Telescope find_files hidden=true)",
	},
	d = {
		description = { "  Find Word            SPC s p" },
		command = "Telescope live_grep",
	},
	e = {
		description = { "  Settings                   ." },
		command = ":e ~/.config/nvim/lua/" .. CONFIG_FILE,
	},
}

vim.g.dashboard_custom_footer = CONFIG.dashboard.custom_footer

vim.g.dashboard_custom_header = CONFIG.dashboard.custom_header
