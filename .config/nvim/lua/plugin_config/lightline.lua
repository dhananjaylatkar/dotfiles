-- lightline

vim.g.lightline = {
	colorscheme = 'onedark';
	active = { 
		left = {{'mode', 'paste'}, {'gitbranch', 'readonly', 'filename', 'modified'}},
		right = {{'lineinfo'}, {'percent'}, {'fileformat', 'fileencoding', 'filetype'}}
	};
	component_function = {gitbranch = 'fugitive#head'};
}
