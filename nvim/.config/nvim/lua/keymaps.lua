-- Mappings
local wk = require("which-key")
local opts = { noremap = true, silent = true }
--Add leader shortcuts
wk.register({
  ["<leader>"] = {
    ["`"] = { "<C-^>", "Switch to last buffer" },
    [","] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Switch buffer" },
    ["<space>"] = { "<cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>", "Find files" },
    p = {
      name = "+project",
      p = { "<cmd>lua require('telescope').extensions.project.project{}<cr>", "Open project" },
    },
    f = {
      name = "+file",
      f = { "<cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>", "Find files" },
      r = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Recent files" },
      g = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Git files" },
      s = { "<cmd>NvimTreeFindFile<cr>", "Open in sidebar" },
    },
    b = {
      name = "+buffer",
      b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Switch buffer" },
      t = { "<cmd>lua require('telescope.builtin').treesitter()<cr>", "Symbols in file" },
      k = { "<cmd>bd<cr>", "Kill buffer" },
      d = { "<cmd>bd<cr>", "Kill buffer" },
      p = { "<cmd>bprev<cr>", "Previous buffer" },
      n = { "<cmd>bnext<cr>", "Next buffer" },
      ["]"] = { "<cmd>bnext<cr>", "Next buffer" },
      ["["] = { "<cmd>bprev<cr>", "Previous buffer" },
      s = { "<cmd>w<cr>", "Save buffer" },
      S = { "<cmd>wa<cr>", "Save all buffers" },
      l = { "<C-^>", "Switch to last buffer" },
      o = { "<cmd>only<cr>", "Close other buffers" },
      O = { "<cmd>enew<cr>", "New empty buffer" },
      f = { "<cmd>Format<cr>", "Format buffer" },
      r = { "<cmd>e<cr>", "Reload buffer" },
    },
    s = {
      name = "+search",
      b = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Search buffer" },
      s = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Search buffer" },
      B = { "<cmd>lua require('telescope.builtin').live_grep({grep_open_files = true})<cr>", "Search open buffers" },
      p = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Search in directory" },
    },
    g = {
      name = "+git",
      f = { "<cmd>lua require('telescope.builtin').git_files()<cr>", "Git files" },
      b = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "Branches" },
      s = { "<cmd>lua require('telescope.builtin').git_status()<cr>", "Status in Telescope" },
      g = { "<cmd>lua require('neogit').open()<cr>", "Neogit" },
      c = { "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", "Commits for current buffer" },
      C = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "Commits for current directory" },
    },
    r = {
      name = "+recent",
      f = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", "Recent files" },
      c = { "<cmd>lua require('telescope.builtin').command_history()<cr>", "Recent commands" },
      s = { "<cmd>SessionLoad<cr>", "Recent sessions" },
      j = { "<cmd>lua require('telescope.builtin').jumplist()<cr>", "Jumplist" },
    },
    h = {
      name = "+harpoon",
      t = { "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "Open terminal" },
      a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file" },
      o = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Quick menu" },
    },
    o = {
      name = "+open",
      t = { "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "Open terminal" },
      h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon quick menu" },
      p = { "<cmd>NvimTreeToggle<cr>", "Project sidebar" },
      f = { "<cmd>NvimTreeFindFile<cr>", "Open file in sidebar" },
    },
    t = {
      name = "toggle",
      t = { "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>", "Terminal" },
      p = { "<cmd>NvimTreeToggle<cr>", "Project sidebar" },
      i = { "<cmd>set list!<cr>", "Indent guides" },
      l = { "<cmd>set number!<cr>", "Line numbers" },
      r = { "<cmd>set relativenumber!<cr>", "Relative line numbers" },
      s = { "<cmd>set expandtab!<cr>", "Spaces/Tabs" },
      m = { "<cmd>lua ToggleMouse()<cr>", "Mouse mode" },
      C = { "<cmd>ColorizerToggle<cr>", "Colorizer" },
      c = { "<cmd>lua require('telescope.builtin').colorscheme()<cr>", "Colorscheme" },
    },
    l = {
      name = "+lsp",
      r = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "List referneces" },
      d = { "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Goto defination" },
      i = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "Goto implementation" },
      c = { "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", "Code actions" },
      C = { "<cmd>lua require('telescope.builtin').lsp_range_code_actions()<cr>", "Code actions on range" },
      s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", "Symbols in buffer" },
      S = { "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", "Symbols in project" },
      e = { "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", "Buffer diagnostics" },
      E = { "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", "Project diagnostics" },
      R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol" },
      f = { "<cmd>Format<cr>", "Format buffer" },
    },
    w = {
      name = "+window",
      s = { "<cmd>sp<cr>", "Window split" },
      n = { "<cmd>vnew<cr>", "New vsplit" },
      N = { "<cmd>new<cr>", "New split" },
      v = { "<cmd>vs<cr>", "Window vsplit" },
      q = { "<cmd>q<cr>", "Quit window" },
      d = { "<cmd>c<cr>", "Delete window" },
      o = { "<cmd>only<cr>", "Close other windows" },
      w = { "<c-w>w", "Goto other window" },
      p = { "<c-w>p", "Goto previous window" },
      t = { "<c-w>t", "Goto top-left window" },
      b = { "<c-w>b", "Goto bottom-right window" },
      r = { "<c-w>r", "Rotate →" },
      R = { "<c-w>R", "Rotate ←" },
      ["<Down>"] = { "<c-w><Down>", "Window down" },
      ["<Up>"] = { "<c-w><Up>", "Window up" },
      ["<Right>"] = { "<c-w><Right>", "Window right" },
      ["<Left>"] = { "<c-w><Left>", "Window left" },
      ["="] = { "<c-w>=", "Balance windows" },
      -- ["+"] = {"<c-w>+", "Increase height"},
      -- ["-"] = {"<c-w>-", "Decrease height"},
      -- [">"] = {"<c-w>>", "Increase width"},
      -- ["<"] = {"<c-w><", "Decrease width"},
    },
  },
  -- common lsp bindings
  ["gd"] = { "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", "Goto symbol defination" },
  ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto symbol declaration" },
  ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover defination" },
  ["gi"] = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "Goto symbol implementation" },
  ["gr"] = { "<cmd>lua require('telescope.builtin').lsp_references()<cr>", "Show symbol referneces" },
  -- Functions keys
  ["<F5>"] = { "<cmd>set list!<cr>", "Indent guides" },
  ["<F2>"] = { "<cmd>NvimTreeToggle<cr>", "Project sidebar" },
  ["<F10>"] = { "<cmd>lua ToggleMouse()<cr>", "Toggle mouse mode" },
}, opts)

--Add map to enter paste mode
vim.o.pastetoggle = "<F3>"

-- Y yank until the end of line
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- Remaps
-- Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
vim.cmd([[nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]])

-- vim.cmd[[nnoremap <Up> <C-y>]]
-- vim.cmd[[nnoremap <Down> <C-e>]]

-- Sizing window horizontally
vim.cmd([[nnoremap <A-h> <C-W><]])
vim.cmd([[nnoremap <A-l> <C-W>>]])

-- Sizing window vertically
-- taller
vim.cmd([[nnoremap <A-k> <C-W>+]])
-- shorter
vim.cmd([[nnoremap <A-j> <C-W>-]])

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Remap escape to leave terminal mode
vim.api.nvim_exec(
  [[
augroup Terminal
  autocmd!
    au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    au TermOpen * set nonu
  augroup end
]],
  false
)
