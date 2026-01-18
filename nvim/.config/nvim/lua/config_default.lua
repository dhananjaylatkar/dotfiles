-- NOTE: Do not edit config_default.lua,
--       copy this file as `config.lua` and edit that.

local M = {}

--[[ Available colorschemes:
  - ayu
  - catppuccin
  - cyberdream
  - everforest
  - gruvbox-material
  - kanagawa
  - nord
  - onedark
  - rosepine
  - tokyonight
  - kanso
--]]
M.colorscheme = "minihues"

-- Plugin config

-- "mini-pick" or "telescope"
M.picker = "mini-pick"

-- LSP
M.lsp = {
  servers = {
    lua_ls = {
      enable = true, -- used by custom config
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            path ~= vim.fn.stdpath("config")
            and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
          then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
            path = {
              "lua/?.lua",
              "lua/?/init.lua",
            },
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        })
      end,
      settings = {
        Lua = {},
      },
    },
  },
}
-- Treesitter
M.ts = {
  langs = { "lua", "c", "cpp" }, -- List of languages
}

-- Notes
M.notes = {
  opts = {
    root = vim.fn.expand("~/code/notes/"),
    picker = M.picker,
  },
}

-- cscope_maps
M.cscope_maps = {
  opts = {
    cscope = {
      picker = M.picker,
      project_rooter = { enable = true },
      db_build_cmd = { script = vim.fn.expand("~/.config/scripts/cs"), args = {} },
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
  folds = false, -- kevinhwang91/nvim-ufo
  notes = true, -- dhananjaylatkar/notes.nvim
  docgen = true, -- dhananjaylatkar/docgen.nvim
  comment = true, -- numToStr/Comment.nvim
  -- echasnovski/mini.nvim modules
  mini_ai = true,
  mini_bracketed = true,
  mini_files = true,
  mini_indentscope = false,
  mini_jump = true,
  mini_move = true,
  mini_splitjoin = false,
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
  mini_cmdline = true,
  mini_tabline = true,
}

M.custom = function()
  -- additional user specific config
end

return M
