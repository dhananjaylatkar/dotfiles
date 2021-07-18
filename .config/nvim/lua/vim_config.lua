-- Vim related config

--Incremental live completion
vim.o.inccommand = "nosplit"

--Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

-- Disable swap files
vim.opt.swapfile = false
vim.opt.shada = { "!", "'1000", "<50", "s10", "h" }

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- copy to system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.cursorline = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 3

-- Tabs
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Prefer windows splitting to the right
vim.opt.splitright = true
-- Prefer windows splitting to the bottom
vim.opt.splitbelow = true

-- confirm when exiting
vim.opt.confirm = true

-- Invisible Chars
vim.opt.listchars = { tab = "› ", eol = "↩", trail = "␣", lead = "␣" }
vim.o.list = true

-- highlight trailing whitespace
vim.cmd([[match ErrorMsg '\s\+$']])

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd([[colorscheme onedark]])

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
