-- Utils: some useful functions/autocmds

-- Last position on re-open
vim.api.nvim_exec(
  [[
  augroup Reposition
    autocmd!
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  augroup end
]],
  false
)

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
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

-- Highlight on yank
vim.api.nvim_exec(
  [[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
]],
  false
)
