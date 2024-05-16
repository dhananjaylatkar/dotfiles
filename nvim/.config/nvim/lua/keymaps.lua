-- Mappings
local M = {}
local wk = require("which-key")
local utils = require("utils")
local map = vim.keymap.set

local goto_terminal = function()
  require("harpoon.term").gotoTerminal(1)
end

M.setup = function(conf, conf_file)
  -- which-key setup
  wk.register({
    ["<leader>"] = {
      p = { name = "+project" },
      f = { name = "+file" },
      b = { name = "+buffer" },
      s = { name = "+search" },
      g = { name = "+git", a = { name = "+actions" } },
      r = { name = "+recent" },
      h = { name = "+harpoon" },
      o = { name = "+open" },
      t = { name = "toggle" },
      l = { name = "+lsp" },
      w = { name = "+window" },
      m = { name = "+markdown" },
      n = { name = "+notes" },
      k = { name = "+config" },
    },
  })

  map("n", "<leader>pp", "<cmd>Telescope project<cr>", { desc = "Open project" })
  map({ "n", "v" }, "<leader>pw", "<cmd>Telescope grep_string<cr>", { desc = "Word search" })

  -- files
  map("n", "<leader><leader>", require("search").open, { desc = "Run" })
  map("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find files" })
  map("n", "<leader>fr", "<cmd>Telescope oldfiles only_cwd=true<cr>", { desc = "Recent files [Cur]" })
  map("n", "<leader>fR", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files [All]" })
  map("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Git files" })
  map("n", "<leader>fs", "<cmd>NvimTreeFindFile<cr>", { desc = "Reveal in tree" })

  -- buffers
  map("n", "<leader>`", "<C-^>", { desc = "Switch to last buffer" })
  map("n", "<leader><tab>", "<C-^>", { desc = "Switch to last buffer" })
  map("n", "<leader>bl", "<C-^>", { desc = "Switch to last buffer" })
  map("n", "<leader>,", "<cmd>Telescope buffers<cr>", { desc = "Switch buffer" })
  map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "Switch buffer" })
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
  map("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search buffer" })
  map("n", "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search buffer" })
  map("n", "<leader>sB", "<cmd>Telescope live_grep grep_open_files=true<cr>", { desc = "Search open buffers" })
  map("n", "<leader>sp", "<cmd>Telescope live_grep<cr>", { desc = "Search in directory" })
  map({ "n", "v" }, "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Word search" })

  -- git
  map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })

  map("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { desc = "Files" })
  map("n", "<leader>gB", "<cmd>Telescope git_branches<cr>", { desc = "Branches" })
  map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Status" })
  map("n", "<leader>gc", "<cmd>Telescope git_bcommits<cr>", { desc = "Commits for current buffer" })
  map("n", "<leader>gC", "<cmd>Telescope git_commits<cr>", { desc = "Commits for current directory" })

  map("n", "<leader>gl", require("gitsigns").blame_line, { desc = "Blame line" })
  map("n", "<leader>gn", require("gitsigns").next_hunk, { desc = "Next hunk" })
  map("n", "<leader>gp", require("gitsigns").prev_hunk, { desc = "Previous hunk" })

  -- git actions
  map("n", "<leader>gas", require("gitsigns").stage_hunk, { desc = "Stage hunk" })
  map("n", "<leader>gau", require("gitsigns").undo_stage_hunk, { desc = "Undo stage hunk" })
  map("n", "<leader>gar", require("gitsigns").reset_hunk, { desc = "Reset hunk" })
  map("n", "<leader>gaR", require("gitsigns").reset_buffer, { desc = "Reset buffer" })
  map("n", "<leader>gap", require("gitsigns").preview_hunk, { desc = "Preview buffer" })
  map("n", "<leader>gaS", require("gitsigns").stage_buffer, { desc = "Stage buffer" })
  map("n", "<leader>gaU", require("gitsigns").reset_buffer_index, { desc = "Rest buffer index" })

  -- Recents
  map("n", "<leader>rR", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files [All]" })
  map("n", "<leader>rr", "<cmd>Telescope oldfiles only_cwd=true<cr>", { desc = "Recent files [Cur]" })
  map("n", "<leader>rc", "<cmd>Telescope command_history<cr>", { desc = "Recent commands" })
  map("n", "<leader>rc", "<cmd>Telescope jumplist<cr>", { desc = "Jumplists" })

  -- Harpoon
  map("n", "<leader>ht", goto_terminal, { desc = "Open terminal" })
  map("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Add file" })
  map("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, { desc = "Quick menu" })

  -- Open stuff
  map("n", "<leader>ot", goto_terminal, { desc = "Open terminal" })
  map("n", "<leader>oh", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon quick menu" })
  map("n", "<leader>op", MiniFiles.open, { desc = "Open file tree" })
  map("n", "<leader>of", "<cmd>NvimTreeFindFile<cr>", { desc = "Open file in sidebar" })

  -- Toggle
  map("n", "<leader>tt", goto_terminal, { desc = "Terminal" })
  map("n", "<leader>tp", MiniFiles.open, { desc = "Open file tree" })
  map("n", "<leader>ti", "<cmd>set list!<cr>", { desc = "Whitespce chars" })
  map("n", "<leader>tl", "<cmd>set number!<cr>", { desc = "Line numbers" })
  map("n", "<leader>tr", "<cmd>set relativenumber!<cr>", { desc = "Relative line numbers" })
  map("n", "<leader>ts", "<cmd>set expandtab!<cr>", { desc = "Spaces/Tabs" })
  map("n", "<leader>tm", utils.ToggleMouse, { desc = "Mouse mode" })
  map("n", "<leader>tC", "<cmd>ColorizerToggle<cr>", { desc = "Colorizer" })
  map("n", "<leader>tc", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme" })

  -- LSP
  map("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", { desc = "List referneces" })
  map("n", "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", { desc = "Goto defination" })
  map("n", "<leader>li", "<cmd>Telescope lsp_implementations<cr>", { desc = "Goto implementation" })
  map("n", "<leader>lc", "<cmd>Telescope lsp_code_actions<cr>", { desc = "Code actions" })
  map("v", "<leader>lc", "<cmd>Telescope lsp_range_code_actions<cr>", { desc = "Code actions on range" })
  map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Symbols in buffer" })
  map("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Symbols in project" })
  map("n", "<leader>le", "<cmd>Telescope lsp_document_diagnostics<cr>", { desc = "Buffer diagnostics" })
  map("n", "<leader>lE", "<cmd>Telescope lsp_workspace_diagnostics<cr>", { desc = "Project diagnostics" })
  map("n", "<leader>lR", vim.lsp.buf.rename, { desc = "Rename symbol" })
  map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format buffer" })
  -- common lsp bindings
  map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Goto defination" })
  map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
  map("n", "K", vim.lsp.buf.hover, { desc = "Hover defination" })
  map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Goto implementation" })
  map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "List referneces" })

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
  map("n", "<A-h>", "<c-w><", { desc = "Window resize left" })
  map("n", "<A-l>", "<c-w>>", { desc = "Window resize right" })
  map("n", "<A-k>", "<c-w>+", { desc = "Window resize up" })
  map("n", "<A-j>", "<c-w>-", { desc = "Window resize down" })

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
  map("n", "<leader>kk", "<cmd>e ~/.config/nvim/lua/" .. conf_file .. "<cr>", { desc = "Open config file" })
  map("n", "<f2>", MiniFiles.open, { desc = "Open file tree" })
  map("n", "<f3>", "<cmd>UndotreeToggle<cr>", { desc = "Undotree" })
  map("n", "<f5>", "<cmd>set list!<cr>", { desc = "Indent guides" })
  map("n", "<f10>", utils.ToggleMouse, { desc = "Toggle mouse mode" })

  -- Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
  map("n", "<cr>", [[{-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()]], { expr = true })

  --Remap for dealing with word wrap
  map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
  map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

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

  map({ "n", "v" }, "<Leader>p", [["+p]], { desc = "Paste from system clipboard" })
  map({ "n", "v" }, "<Leader>P", [["+P]], { desc = "Paste from system clipboard" })

  -- folds
  map("n", "zR", require("ufo").openAllFolds)
  map("n", "zM", require("ufo").closeAllFolds)
  map("n", "zp", require("ufo").peekFoldedLinesUnderCursor)

  -- Replace all instances of highlighted words
  map("v", "<leader>r", '"hy:%s/<C-r>h//g<left><left>')

  map("n", "<leader>id", "<cmd>DocGen<cr>", { desc = "Insert func doc" })
end

return M
