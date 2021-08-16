-- Set colorscheme (order is important here)
vim.o.termguicolors = true

-- Onedark
-- vim.g.onedark_terminal_italics = 2
-- vim.cmd([[colorscheme onedark]])
-- vim.g.lightline.colorscheme = 'onedark'

-- Everforest
-- vim.g.everforest_background = 'hard' -- soft, medium
-- vim.g.everforest_enable_italic = 1
-- vim.g.lightline.colorscheme = 'everforest'
-- vim.cmd([[colorscheme everforest]])

-- Tokyonight
vim.g.tokyonight_style = "night" -- storm, day
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.cmd[[colorscheme tokyonight]]
-- vim.g.lightline.colorscheme = 'tokyonight'


