require("cyberdream").setup({
  variant = "default",
  transparent = false,
  saturation = 1,
  colors = {},
  highlights = {
    ["@property.c"] = { fg = require("cyberdream.colors").default.cyan, bg = "NONE" },
  },
  italic_comments = false,
  hide_fillchars = false,
  borderless_pickers = false,
  terminal_colors = true,
  cache = true,
})

vim.cmd.colorscheme("cyberdream")
