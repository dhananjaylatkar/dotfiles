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

local function start_cscope_lsp()
  local cmd = vim.fn.exepath("cscope_lsp")
  if cmd == "" then
    return
  end

  local root_files =
    { "cscope.out", "cscope.files", "cscope.in.out", "cscope.out.in", "cscope.out.po", "cscope.po.out" }
  local paths = vim.fs.find(root_files, { stop = vim.env.HOME })
  local root_dir = vim.fs.dirname(paths[1])

  if root_dir then
    vim.lsp.start({
      name = "cscope_lsp",
      cmd = { cmd },
      root_dir = root_dir,
      filetypes = { "c", "h", "cpp", "hpp" },
    })
  end
end

autocmd("FileType", {
  pattern = { "c", "h", "cpp", "hpp" },
  desc = "Start cscope_lsp",
  callback = start_cscope_lsp,
})
