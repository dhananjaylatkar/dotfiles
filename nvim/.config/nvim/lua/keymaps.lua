-- Mappings
local wk = require("which-key")
local opts = { noremap = true, silent = true }
--Add leader shortcuts
wk.register({
  ["<leader>"] = {
    ["`"] = { "<C-^>", "Switch to last buffer" },
    ["<Tab>"] = { "<C-^>", "Switch to last buffer" },
    [","] = {
      "<cmd>Telescope buffers<cr>",
      "Switch buffer",
    },
    ["<space>"] = {
      "<cmd>Telescope find_files hidden=true<cr>",
      "Find files",
    },
    p = {
      name = "+project",
      p = {
        "<cmd>Telescope project<cr>",
        "Open project",
      },
      w = {
        "<cmd>lua require('telescope.builtin').grep_string{search = vim.fn.expand('<cword>')}<cr>",
        "Word search",
      },
    },
    f = {
      name = "+file",
      f = {
        "<cmd>Telescope find_files hidden=true<cr>",
        "Find files",
      },
      r = {
        "<cmd>Telescope oldfiles<cr>",
        "Recent files",
      },
      g = { "<cmd>Telescope git_files<cr>", "Git files" },
      s = { "<cmd>NvimTreeFindFile<cr>", "Open in sidebar" },
    },
    b = {
      name = "+buffer",
      b = {
        "<cmd>Telescope buffers<cr>",
        "Switch buffer",
      },
      t = {
        "<cmd>Telescope treesitter<cr>",
        "Symbols in file",
      },
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
      b = {
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        "Search buffer",
      },
      s = {
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        "Search buffer",
      },
      B = {
        "<cmd>Telescope live_grep grep_open_files=true<cr>",
        "Search open buffers",
      },
      p = {
        "<cmd>Telescope live_grep<cr>",
        "Search in directory",
      },
      w = {
        "<cmd>lua require('telescope.builtin').grep_string{search = vim.fn.expand('<cword>')}<cr>",
        "Search word",
      },
    },
    g = {
      name = "+git",
      f = { "<cmd>Telescope git_files<cr>", "Git files" },
      b = {
        "<cmd>Telescope git_branches<cr>",
        "Branches",
      },
      s = {
        "<cmd>Telescope git_status<cr>",
        "Status in Telescope",
      },
      g = { "<cmd>Neogit<cr>", "Neogit" },
      c = {
        "<cmd>Telescope git_bcommits<cr>",
        "Commits for current buffer",
      },
      C = {
        "<cmd>Telescope git_commits<cr>",
        "Commits for current directory",
      },
    },
    r = {
      name = "+recent",
      f = {
        "<cmd>Telescope oldfiles<cr>",
        "Recent files",
      },
      c = {
        "<cmd>Telescope command_history<cr>",
        "Recent commands",
      },
      s = { "<cmd>SessionLoad<cr>", "Recent sessions" },
      j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
    },
    h = {
      name = "+harpoon",
      t = {
        "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>",
        "Open terminal",
      },
      a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file" },
      o = {
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
        "Quick menu",
      },
    },
    o = {
      name = "+open",
      t = {
        "<cmd>lua require('harpoon.term').gotoTerminal(1)<cr>",
        "Open terminal",
      },
      h = {
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
        "Harpoon quick menu",
      },
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
      c = {
        "<cmd>Telescope colorscheme<cr>",
        "Colorscheme",
      },
    },
    l = {
      name = "+lsp",
      r = {
        "<cmd>Telescope lsp_references<cr>",
        "List referneces",
      },
      d = {
        "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>",
        "Goto defination",
      },
      i = {
        "<cmd>Telescope lsp_implementations<cr>",
        "Goto implementation",
      },
      c = {
        "<cmd>Telescope lsp_code_actions<cr>",
        "Code actions",
      },
      C = {
        "<cmd>Telescope lsp_range_code_actions<cr>",
        "Code actions on range",
      },
      s = {
        "<cmd>Telescope lsp_document_symbols<cr>",
        "Symbols in buffer",
      },
      S = {
        "<cmd>Telescope lsp_workspace_symbols<cr>",
        "Symbols in project",
      },
      e = {
        "<cmd>Telescope lsp_document_diagnostics<cr>",
        "Buffer diagnostics",
      },
      E = {
        "<cmd>Telescope lsp_workspace_diagnostics<cr>",
        "Project diagnostics",
      },
      R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol" },
      f = { "<cmd>Format<cr>", "Format buffer" },
      t = { "<cmd>SymbolsOutline<cr>", "Tree view" },
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
  ["gd"] = {
    "<cmd>Telescope lsp_definitions<cr>",
    "Goto symbol defination",
  },
  ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto symbol declaration" },
  ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover defination" },
  ["gi"] = {
    "<cmd>Telescope lsp_implementations<cr>",
    "Goto symbol implementation",
  },
  ["gr"] = {
    "<cmd>Telescope lsp_references<cr>",
    "Show symbol referneces",
  },
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
vim.api.nvim_set_keymap(
  "n",
  "k",
  "v:count == 0 ? 'gk' : 'k'",
  { noremap = true, expr = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "j",
  "v:count == 0 ? 'gj' : 'j'",
  { noremap = true, expr = true, silent = true }
)

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

-- Sneak remaps
vim.cmd([[
map f <Plug>Sneak_s
map F <Plug>Sneak_S
]])
