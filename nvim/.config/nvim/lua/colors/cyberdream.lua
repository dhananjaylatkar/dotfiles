require("cyberdream").setup({
  variant = "default",
  transparent = false,
  saturation = 1,
  colors = {},
  highlights = {},
  italic_comments = false,
  hide_fillchars = false,
  borderless_pickers = false,
  terminal_colors = true,
  cache = true,
})

vim.cmd.colorscheme("cyberdream")
