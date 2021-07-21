-- Dashboard
vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_section = {
  a = {
    description = { "  Find File            SPC f f" },
    command = "lua require('telescope.builtin').find_files({hidden = true})",
  },
  b = {
    description = { "ﭯ  Recent Files         SPC r f" },
    command = "Telescope oldfiles",
  },
  c = {
    description = { "  Find Word            SPC s p" },
    command = "Telescope live_grep",
  },
  d = {
    description = { "  Settings                    " },
    command = ":e ~/.config/nvim/init.lua",
  },
}

vim.g.dashboard_custom_footer = { "Neovim" }

vim.g.dashboard_custom_header = {
  " ______       ___  _______  __   __ ",
  "|      |     |   ||   _   ||  | |  |",
  "|  _    |    |   ||  |_|  ||  |_|  |",
  "| | |   |    |   ||       ||       |",
  "| |_|   | ___|   ||       ||_     _|",
  "|       ||       ||   _   |  |   |  ",
  "|______| |_______||__| |__|  |___|  ",
  "",
  "",
  "",
  "",
}
