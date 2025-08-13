-- Vim related config
local vim_defaults = {
  autoindent = true,
  breakindent = true, -- Enable break indent
  cindent = true,
  cmdheight = 1,
  confirm = true, -- confirm when exiting
  cursorline = true,
  hidden = true, --Do not save when switching buffers
  hlsearch = true, -- Set highlight on search
  ignorecase = true, -- Case insensitive searching
  inccommand = "nosplit", -- Incremental live completion
  incsearch = true,
  list = false,
  listchars = { tab = "› ", trail = "·", lead = "·" }, -- must enable `list`
  -- listchars = { tab = "› ", eol = "↩", trail = "␣", lead = "␣" },
  mouse = "a", -- enable mouse mode
  number = true, -- enable line numbers
  relativenumber = true, -- relative line numbers
  scrolloff = 3,
  shada = { "!", "'1000", "<50", "s10", "h" }, -- shada file
  shiftwidth = 4,
  signcolumn = "yes",
  smartcase = true, -- UNLESS /C or capital in search
  softtabstop = 4,
  expandtab = true, -- convert tabs to spaces
  splitbelow = true,
  splitright = true,
  swapfile = false, -- Disable swap files
  tabstop = 4,
  updatetime = 250, -- Decrease update time
  wrap = true,
  termguicolors = true,
  colorcolumn = "80",
  completeopt = "menuone,noinsert",
  spell = true,
  spelllang = { "en_us" },
}

-- apply vim config
local vim_opts = vim.tbl_deep_extend("force", vim_defaults, vim.g.dha.conf.vim)
for k, v in pairs(vim_opts) do
  vim.opt[k] = v
end

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
