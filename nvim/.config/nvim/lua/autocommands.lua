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

-- Remap escape to leave terminal mode
autocmd("TermOpen", {
  callback = function()
    vim.keymap.set("t", "<esc>", [[<c-\><c-n>]], { buffer = true })
    vim.keymap.set("n", "<esc>", "<cmd>q<cr>", { buffer = true })
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
  group = group,
})

autocmd("BufWritePost", {
  pattern = { "*.c", "*.h" },
  callback = function()
    vim.cmd("Cscope db build")
  end,
  group = group,
})

-- Show relative numbers only when they matter (linewise and blockwise
-- selection) and 'number' is set (avoids horizontal flickering)
autocmd("ModeChanged", {
  pattern = "*:[V\x16]*",
  callback = function()
    vim.wo.relativenumber = vim.wo.number
  end,
  desc = "Show relative line numbers",
})

-- Hide relative numbers when neither linewise/blockwise mode is on
autocmd("ModeChanged", {
  pattern = "[V\x16]*:*",
  callback = function()
    vim.wo.relativenumber = string.find(vim.fn.mode(), "^[V\22]") ~= nil
  end,
  desc = "Hide relative line numbers",
})
