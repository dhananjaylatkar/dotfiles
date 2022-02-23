-- Which-key
require("which-key").setup({
	window = {
		margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 1, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		spacing = 1, -- spacing between columns
	},
	hidden = {
		"<silent>",
		"<cmd>",
		"<Cmd>",
		"<CR>",
		"call",
		"lua",
		"^:",
		"^ ",
		"<Plug>",
	}, -- hide mapping boilerplate
})
vim.opt.timeoutlen = 500 -- controls when WhichKey opens
