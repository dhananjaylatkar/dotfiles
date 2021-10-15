-- Vim related config

for k, v in pairs(CONFIG.vim) do
  vim.opt[k] = v
end

-- highlight trailing whitespace
vim.cmd([[match ErrorMsg '\s\+$']])

--Remap space as leader key
vim.api.nvim_set_keymap(
  "",
  "<Space>",
  "<Nop>",
  { noremap = true, silent = true }
)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
