-- Dashboard config

require("dashboard").setup({
	theme = "doom",
	config = {
		header = CONFIG.dashboard.custom_header,
		footer = CONFIG.dashboard.custom_footer,
        center = {
          {
            icon = 'ﭯ ',
            desc = 'Recent Files           ',
            key = 'r',
            keymap = 'SPC f r',
            action = 'Telescope oldfiles'
          },
          {
            icon = ' ',
            desc = 'Open Project           ',
            key = 'p',
            keymap = 'SPC p p',
            action = 'Telescope project'
          },
          {
            icon = ' ',
            desc = 'Find Files           ',
            key = 'b',
            keymap = 'SPC f f',
            action = 'Telescope find_files hidden=true'
          },
          {
            icon = ' ',
            desc = 'Find Text',
            key = 't',
            keymap = 'SPC s p',
            action = 'Telescope live_grep'
          },
          {
            icon = ' ',
            desc = 'Config file',
            key = '.',
            keymap = 'SPC k c',
            action = 'e ~/.config/nvim/lua/' .. CONFIG_FILE
          },
        },
	},
})
