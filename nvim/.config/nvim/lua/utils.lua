-- Utils: some useful functions

local M = {}

-- Toggle to disable mouse mode and indentlines for easier paste
M.ToggleMouse = function()
	if vim.o.mouse == "a" then
		vim.cmd("set nolist")
		vim.wo.signcolumn = "no"
		vim.o.mouse = "v"
		vim.wo.number = false
		vim.wo.relativenumber = false
		print("Mouse disabled")
	else
		vim.cmd("set list")
		vim.wo.signcolumn = "yes"
		vim.o.mouse = "a"
		vim.wo.number = true
		vim.wo.relativenumber = true
		print("Mouse enabled")
	end
end

return M
