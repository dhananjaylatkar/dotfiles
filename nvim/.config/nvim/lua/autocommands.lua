-- Useful autocmds

local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("UsefulAutocmds", { clear = true })

-- Last position on re-open
autocmd("BufReadPost", {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
  group = group,
})

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = group,
})
