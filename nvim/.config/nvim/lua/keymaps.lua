-- Mappings
local utils = require("utils")
local picker = require("picker." .. vim.g.dha.conf.picker)
local map = vim.keymap.set

local miniclue_add = function(opts)
  if not MiniClue then return end
  table.insert(MiniClue.config.clues, opts)
end

miniclue_add({ mode = "n", keys = "<leader>b", desc = "+buffer" })
miniclue_add({ mode = "n", keys = "<leader>f", desc = "+file" })
miniclue_add({ mode = "n", keys = "<leader>g", desc = "+git" })
miniclue_add({ mode = "n", keys = "<leader>k", desc = "+config" })
miniclue_add({ mode = "n", keys = "<leader>l", desc = "+lsp" })
miniclue_add({ mode = "n", keys = "<leader>m", desc = "+markdown" })
miniclue_add({ mode = "n", keys = "<leader>n", desc = "+notes" })
miniclue_add({ mode = "n", keys = "<leader>o", desc = "+open" })
miniclue_add({ mode = "n", keys = "<leader>p", desc = "+project" })
miniclue_add({ mode = "n", keys = "<leader>r", desc = "+recent" })
miniclue_add({ mode = "n", keys = "<leader>s", desc = "+search" })
miniclue_add({ mode = "n", keys = "<leader>t", desc = "+toggle" })
miniclue_add({ mode = "n", keys = "<leader>w", desc = "+window" })
miniclue_add({ mode = "n", keys = "<leader>i", desc = "+insert" })

-- files
map("n", "<leader><leader>", picker.files, { desc = "Find files" })
map("n", "<leader>ff", picker.files, { desc = "Find files" })
map("n", "<leader>fr", picker.recent_cwd, { desc = "Recent files [Cur]" })
map("n", "<leader>fR", picker.recent, { desc = "Recent files [All]" })
map("n", "<leader>pp", picker.project, { desc = "Open project" })
map("n", "<leader>fs", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, { desc = "Reveal in file tree" })

-- buffers
map("n", "<leader>`", "<C-^>", { desc = "Switch to last buffer" })
map("n", "<leader><tab>", "<C-^>", { desc = "Switch to last buffer" })
map("n", "<leader>bl", "<C-^>", { desc = "Switch to last buffer" })
map("n", "<leader>,", picker.buffers, { desc = "Switch buffer" })
map("n", "<leader>bb", picker.buffers, { desc = "Switch buffer" })
map("n", "<leader>bk", "<cmd>bd<cr>", { desc = "Delete buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprev<cr>", { desc = "Previous buffer" })
map("n", "<c-j>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<c-k>", "<cmd>bprev<cr>", { desc = "Previous buffer" })
map("n", "<leader>bs", "<cmd>w<cr>", { desc = "Save buffer" })
map("n", "<leader>bS", "<cmd>wa<cr>", { desc = "Save all buffer" })
map("n", "<leader>bo", "<cmd>only<cr>", { desc = "Close other splits" })
map("n", "<leader>bO", "<cmd>enew<cr>", { desc = "New empty buffer" })
map("n", "<leader>bf", "<cmd>Format<cr>", { desc = "Format buffer" })
map("n", "<leader>br", "<cmd>e<cr>", { desc = "Reload buffer" })

-- search strings
map("n", "<leader>sb", picker.buffer_search, { desc = "Search buffer" })
map("n", "<leader>ss", picker.buffer_search, { desc = "Search buffer" })
map("n", "<leader>sB", picker.buffer_grep_live, { desc = "Search open buffers" })
map("n", "<leader>sp", picker.grep_live, { desc = "Search in directory" })
map({ "n", "v" }, "<leader>sw", picker.grep_cword, { desc = "Word search" })
map({ "n", "v" }, "<leader>pw", picker.grep_cword, { desc = "Word search" })

-- git
map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })

-- Recents
map("n", "<leader>rR", picker.recent, { desc = "Recent files [All]" })
map("n", "<leader>rr", picker.recent_cwd, { desc = "Recent files [Cur]" })
map("n", "<leader>rc", picker.history, { desc = "Recent commands" })
map("n", "<leader>rj", picker.jumplist, { desc = "Jumplists" })

-- Open stuff
map("n", "<leader>ot", "<cmd>ToggleTerm direction=float<cr>", { desc = "Open terminal" })
map("n", "<leader>op", MiniFiles.open, { desc = "Open file tree" })
map("n", "<leader>of", function()
  MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, { desc = "Reveal in file tree" })

-- Toggle
map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal" })
map("n", "<leader>tp", MiniFiles.open, { desc = "Open file tree" })
map("n", "<leader>ti", "<cmd>set list!<cr>", { desc = "Whitespce chars" })
map("n", "<leader>tl", "<cmd>set number!<cr>", { desc = "Line numbers" })
map("n", "<leader>tr", "<cmd>set relativenumber!<cr>", { desc = "Relative line numbers" })
map("n", "<leader>ts", "<cmd>set expandtab!<cr>", { desc = "Spaces/Tabs" })
map("n", "<leader>tm", utils.ToggleMouse, { desc = "Mouse mode" })

-- LSP
map("n", "<leader>lr", picker.lsp_references, { desc = "List referneces" })
map("n", "<leader>ld", picker.lsp_definitions, { desc = "Goto defination" })
map("n", "<leader>li", picker.lsp_implementations, { desc = "Goto implementation" })
map("n", "<leader>lc", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>ls", picker.lsp_document_symbols, { desc = "Symbols in buffer" })
map("n", "<leader>lS", picker.lsp_workspace_symbols, { desc = "Symbols in project" })
map("n", "<leader>le", picker.lsp_document_diagnostics, { desc = "Buffer diagnostics" })
map("n", "<leader>lE", picker.lsp_workspace_diagnostics, { desc = "Project diagnostics" })
map("n", "<leader>lR", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
-- common lsp bindings
map("n", "gd", picker.lsp_definitions, { desc = "Goto defination" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover defination" })
map("n", "gi", picker.lsp_implementations, { desc = "Goto implementation" })
map("n", "gr", picker.lsp_references, { desc = "List referneces" })

-- Window
map("n", "<leader>ws", "<cmd>sp<cr>", { desc = "Window split" })
map("n", "<leader>wv", "<cmd>vsp<cr>", { desc = "Window vsplit" })
map("n", "<leader>wn", "<cmd>vnew<cr>", { desc = "New vsplit" })
map("n", "<leader>wN", "<cmd>new<cr>", { desc = "Window new" })
map("n", "<leader>wq", "<cmd>q<cr>", { desc = "Quit window" })
map("n", "<leader>wo", "<cmd>only<cr>", { desc = "Close other windows" })
map("n", "<leader>ww", "<c-w>w", { desc = "Goto other window" })
map("n", "<leader>wp", "<c-w>p", { desc = "Goto previous window" })
map("n", "<leader>wt", "<c-w>t", { desc = "Goto top-left window" })
map("n", "<leader>wb", "<c-w>b", { desc = "Goto bottom-right window" })
map("n", "<leader>wr", "<c-w>r", { desc = "Rotate →" })
map("n", "<leader>wR", "<c-w>R", { desc = "Rotate ←" })
map("n", "<leader>w<down>", "<c-w><down>", { desc = "Window down" })
map("n", "<leader>w<up>", "<c-w><up>", { desc = "Window up" })
map("n", "<leader>w<right>", "<c-w><right>", { desc = "Window right" })
map("n", "<leader>w<left>", "<c-w><left>", { desc = "Window left" })
map("n", "<leader>w=", "<c-w>=", { desc = "Balance windows" })

-- Markdown
map("n", "<leader>m>", "<cmd>'<,'>HeaderIncrease<cr>", { desc = "Header increase" })
map("n", "<leader>m<", "<cmd>'<,'>HeaderDecrease<cr>", { desc = "Header decrease" })
map("n", "<leader>mt", "<cmd>TableFormat<cr>", { desc = "Format table" })
map("n", "<leader>ml", "<cmd>Toc<cr>", { desc = "Show ToC" })
map("n", "<leader>mi", "<cmd>InsertToc<cr>", { desc = "Insert ToC" })
map("n", "<leader>mI", "<cmd>InsertNToc<cr>", { desc = "Insert numbered ToC" })

-- Notes
map("n", "<leader>nf", "<cmd>NotesFind<cr>", { desc = "Find notes" })
map("n", "<leader>ns", "<cmd>NotesGrep<cr>", { desc = "Search in notes" })
map("n", "<leader>nn", "<cmd>NotesNew<cr>", { desc = "New note" })

-- Misc
map("n", "<leader>kk", "<cmd>e ~/.config/nvim/lua/" .. vim.g.dha.conf.file .. "<cr>", { desc = "Open config file" })
map("n", "<f2>", MiniFiles.open, { desc = "Open file tree" })
map("n", "<f3>", "<cmd>UndotreeToggle<cr>", { desc = "Undotree" })
map("n", "<f5>", "<cmd>set list!<cr>", { desc = "Indent guides" })
map("n", "<f10>", utils.ToggleMouse, { desc = "Toggle mouse mode" })

-- Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
map("n", "<cr>", [[{-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]], { expr = true })

--Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("n", "<up>", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "<down>", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Delete word/line in insert mode
map("i", "<C-U>", "<C-G>u<C-U>")
map("i", "<C-W>", "<C-G>u<C-W>")

-- Keep selection when indenting
map("v", ">", ">gv")
map("v", "<", "<gv")

-- System Clipboard
map("v", "<Leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("v", "<Leader>d", [["+d]], { desc = "Cut to system clipboard" })

map("n", "<Leader>y", [["+yy]], { desc = "Yank to system clipboard" })
map("n", "<Leader>d", [["+dd]], { desc = "Cut to system clipboard" })

map({ "n", "v" }, "<Leader>is", [["+p]], { desc = "Paste from system clipboard" })
map({ "n", "v" }, "<Leader>iS", [["+P]], { desc = "Paste from system clipboard" })

-- Replace all instances of highlighted words
map("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>')

map("n", "<leader>id", "<cmd>DocGen<cr>", { desc = "Insert func doc" })
