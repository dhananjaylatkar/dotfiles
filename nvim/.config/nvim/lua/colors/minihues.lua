local colors = {
  { name = "green", bg = "#1F2C24", fg = "#E7DDC7" },
  { name = "blue", bg = "#232E3F", fg = "#EEECE3" },
  { name = "purple", bg = "#020019", fg = "#FEF1EF" },
  { name = "black", bg = "#121212", fg= "#e0e0e0"},
  { name = "pink", bg = "#264653", fg= "#FFCAD4"},
}

math.randomseed(vim.uv.hrtime())
local c = colors[math.random(#colors)]

require("mini.hues").setup({
  background = c.bg,
  foreground = c.fg,
  saturation = "high",
  plugins = {
    default = false,
    ["echasnovski/mini.nvim"] = true,
  },
})
