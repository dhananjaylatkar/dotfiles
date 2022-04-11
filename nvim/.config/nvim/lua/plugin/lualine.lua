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
		component_separators = { "", "" },
		section_separators = { "", "" },
		disabled_filetypes = { "dashboard" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = { spaces, "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree", "quickfix" },
})
