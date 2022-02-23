-- Set colorscheme (order is important here)
vim.o.termguicolors = true
local color = CONFIG.colorscheme

if color == "onedark" then
	-- Onedark
	vim.g.onedark_terminal_italics = 2
	vim.cmd([[colorscheme onedark]])
elseif color == "everforest" then
	-- Everforest
	vim.g.everforest_background = "hard" -- hard, soft, medium
	vim.g.everforest_enable_italic = 1
	vim.cmd([[colorscheme everforest]])
elseif color == "tokyonight" then
	-- Tokyonight
	vim.g.tokyonight_style = "storm" -- night, storm, day
	vim.g.tokyonight_italic_functions = true
	vim.g.tokyonight_italic_comments = true
	vim.g.tokyonight_terminal_colors = true
	vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
	vim.cmd([[colorscheme tokyonight]])
	-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
elseif color == "rose-pine" then
	-- rose-pine
	vim.g.rose_pine_variant = "base" -- base, moon, dawn
	vim.g.rose_pine_disable_italics = false
	vim.g.rose_pine_disable_background = false
	vim.g.rose_pine_bold_vertical_split_line = true
	vim.cmd([[colorscheme rose-pine]])
elseif color == "ayu" then
	-- ayu
	require("ayu").setup({
		mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
	})
	vim.cmd([[colorscheme ayu]])
elseif color == "kanagawa" then
	-- kanagawa
	vim.cmd([[colorscheme kanagawa]])
else
	-- Gruvbox
	vim.g.gruvbox_material_enable_italic = 1
	vim.g.gruvbox_material_background = "hard" -- hard, soft, medium
	vim.g.gruvbox_material_palette = "mix" -- original, mix, material
	vim.g.gruvbox_material_enable_italic = 1
	vim.cmd([[colorscheme gruvbox-material]])
end
