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

-- Show whitespace chars only in insert mode
autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.wo.list = true
  end,
  group = group,
  desc = "Show Whitespace Chars",
})
autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.wo.list = false
  end,
  group = group,
  desc = "Hide Whitespace Chars",
})

-- auto resize splits when the terminal's window is resized
autocmd("VimResized", { command = "wincmd =" })

autocmd("FileType", {
  pattern = { "git" },
  callback = function()
    vim.opt_local.spell = false
  end,
  group = group,
})

autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp" },
  callback = function()
    vim.g.sleuth_c_heuristics = 0
    vim.g.sleuth_cpp_heuristics = 0
    vim.g.sleuth_h_heuristics = 0
    vim.g.sleuth_hpp_heuristics = 0

    vim.opt_local.shiftwidth = 8
    vim.opt_local.tabstop = 8
    vim.opt_local.expandtab = false
  end,
  group = group,
})

autocmd("FileType", {
  pattern = { "Neogit*", "minifiles" },
  callback = function()
    vim.b.dha_force_hjkl = false
  end,
  group = group,
})
