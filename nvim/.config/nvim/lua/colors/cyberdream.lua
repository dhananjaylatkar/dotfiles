require("cyberdream").setup({
  variant = "default",
  transparent = false,
  saturation = 1,
  colors = {},
  overrides = function(c)
    return {
      ["@property.c"] = { fg = c.cyan },
      ["@property.cpp"] = { fg = c.cyan },
    }
  end,
  italic_comments = false,
  hide_fillchars = false,
  borderless_pickers = false,
  terminal_colors = true,
  cache = true,
})

vim.cmd.colorscheme("cyberdream")
