-- Dashboard config
local M = {}

M.setup = function(config, config_file)
  require("dashboard").setup({
    theme = "doom",
    config = {
      header = config.dashboard.custom_header,
      footer = config.dashboard.custom_footer,
      center = {
        {
          icon = "ﭯ ",
          desc = "Recent Files [Cur]           ",
          key = "r",
          keymap = "SPC f r",
          action = "Telescope oldfiles only_cwd=true",
        },
        {
          icon = "ﭯ ",
          desc = "Recent Files [All]           ",
          key = "R",
          keymap = "SPC f R",
          action = "Telescope oldfiles",
        },
        {
          icon = " ",
          desc = "Open Project           ",
          key = "p",
          keymap = "SPC p p",
          action = "Telescope project",
        },
        {
          icon = " ",
          desc = "Find Files           ",
          key = "f",
          keymap = "SPC f f",
          action = "Telescope find_files hidden=true",
        },
        {
          icon = " ",
          desc = "Find Text",
          key = "t",
          keymap = "SPC s p",
          action = "Telescope live_grep",
        },
        {
          icon = " ",
          desc = "Config file",
          key = ".",
          keymap = "SPC k c",
          action = "e ~/.config/nvim/lua/" .. config_file,
        },
      },
    },
  })
end

return M
