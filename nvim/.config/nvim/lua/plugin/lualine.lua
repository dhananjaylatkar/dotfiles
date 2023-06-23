-- lualine

local spaces = {
	function()
		if not vim.api.nvim_buf_get_option(0, "expandtab") then
			return "Tab Size: " .. vim.api.nvim_buf_get_option(0, "tabstop")
		end
		local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
		if size == 0 then
			size = vim.api.nvim_buf_get_option(0, "tabstop")
		end
		return "Spaces: " .. size
	end,
	cond = function()
		return vim.fn.winwidth(0) > 70
	end,
	color = {},
}
--                                     
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = CONFIG.colorscheme,
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard" },
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "g:cscope_maps_statusline_indicator", spaces, "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree", "quickfix" },
})
