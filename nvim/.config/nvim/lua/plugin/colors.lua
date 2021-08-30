-- Set colorscheme (order is important here)
vim.o.termguicolors = true
local M = {}

-- Onedark
function M.onedark()
  vim.g.onedark_terminal_italics = 2
  vim.cmd([[colorscheme onedark]])
end

-- Everforest
function M.everforest()
  vim.g.everforest_background = "hard" -- hard, soft, medium
  vim.g.everforest_enable_italic = 1
  vim.cmd([[colorscheme everforest]])
end

-- Tokyonight
function M.tokyonight()
  vim.g.tokyonight_style = "storm" -- night, storm, day
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_italic_comments = true
  vim.g.tokyonight_terminal_colors = true
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
  vim.cmd([[colorscheme tokyonight]])
  -- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
end

-- Gruvbox
function M.gruvbox()
  vim.g.gruvbox_material_enable_italic = 1
  vim.g.gruvbox_material_background = "hard" -- hard, soft, medium
  vim.g.gruvbox_material_palette = "mix" -- original, mix, material
  vim.g.gruvbox_material_enable_italic = 1
  vim.cmd([[colorscheme gruvbox-material]])
end

-- gruvbuddy
function M.gruvbuddy()
  require("colorbuddy").colorscheme("gruvbuddy")
end

return M
