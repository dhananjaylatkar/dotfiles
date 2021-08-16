-- Dashboard
vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_section = {
  a = {
    description = { "  Open Project         SPC p p" },
    command = "lua require('telescope').extensions.project.project{}",
  },
  b = {
    description = { "  Find File            SPC f f" },
    command = "lua require('telescope.builtin').find_files({hidden = true})",
  },
  c = {
    description = { "ﭯ  Recent Files         SPC r f" },
    command = "Telescope oldfiles",
  },
  d = {
    description = { "  Find Word            SPC s p" },
    command = "Telescope live_grep",
  },
  e = {
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
