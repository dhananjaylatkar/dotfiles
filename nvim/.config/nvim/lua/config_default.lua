-- NOTE: Do not edit config_default.lua,
--       copy this file as `config.lua` and edit that.

local M = {}

--[[ Available colorschemes:
  - ayu
  - catppuccin
  - everforest
  - gruvbox-material
  - kanagawa
  - nord
  - onedark
  - rosepine
  - tokyonight
--]]
M.colorscheme = "catppuccin"

-- Plugin config

-- "mini-pick" or "telescope"
M.picker = "mini-pick"

-- LSP
M.lsp = {
  -- List of LSP servers to enable
  -- Use :LspInstallInfo to check available servers
  -- Use empty table if no settings are required
  servers = {
    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        diagnostics = { globals = { "vim" } },
      },
    },
  },
}
-- Treesitter
M.treesitter = {
  ensure_installed = { "lua" }, -- List of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    disable = {}, -- List of parsers to disable
  },
}

-- Notes
M.notes = {
  opts = {
    root = os.getenv("HOME") .. "/code/notes/",
    picker = M.picker,
  },
}

-- cscope_maps
M.cscope_maps = {
  ft = { "c", "h", "cpp", "ministarter" },
  cmd = { "Cscope", "Cstag", "Cs" },
  keys = "<C-]>",
  opts = {
    cscope = {
      picker = M.picker,
      project_rooter = { enable = true },
    },
  },
}

M.snippets = function()
  return {}
end

-- Vim options
-- NOTE: Overide vim options using this table (defaults can be found in vim_config.lua).
M.vim = {}

-- Plugins
M.enable = {
  telescope = false, -- nvim-telescope/telescope.nvim
  neogit = true, -- TimUntersberger/neogit
  git_blame = true, -- f-person/git-blame.nvim
  blame = true, -- FabijanZulj/blame.nvim
  lsp = true, -- neovim/nvim-lspconfig
  undotree = true, -- mbbill/undotree
  nvim_treesitter = true, -- nvim-treesitter/nvim-treesitter
  nvim_treesitter_context = true, -- nvim-treesitter/nvim-treesitter-context
  formatter = true, -- mhartington/formatter.nvim
  vim_sleuth = true, -- tpope/vim-sleuth
  cscope_maps = true, -- dhananjaylatkar/cscope_maps.nvim
  lualine = true, -- hoob3rt/lualine.nvim
  vim_markdown = true, -- plasticboy/vim-markdown
  folds = true, -- kevinhwang91/nvim-ufo
  notes = true, -- dhananjaylatkar/notes.nvim
  docgen = true, -- dhananjaylatkar/docgen.nvim
  comment = true, -- numToStr/Comment.nvim
  -- echasnovski/mini.nvim modules
  mini_ai = true,
  mini_bracketed = true,
  mini_files = true,
  mini_indentscope = true,
  mini_jump = true,
  mini_move = true,
  mini_splitjoin = true,
  mini_starter = true,
  mini_surround = true,
  mini_trailspace = true,
  mini_pick = true,
  mini_extra = true,
  mini_diff = true,
  mini_hipatterns = true,
  mini_cursorword = true,
  mini_icons = true,
  mini_clue = true,
  mini_completion = true,
  mini_snippets = true,
}

M.custom = function()
  -- additional user specific config
end

return M
