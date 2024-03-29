local M = {}
local opts = {
  defaults = {
    lazy = true,
  },
}

local plugins = function(conf, conf_file)
  return {
    { "nvim-lua/plenary.nvim" },

    -- 2 char search
    {
      "ggandor/lightspeed.nvim",
      event = "BufRead",
      init = function()
        vim.cmd([[
          nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
          nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
          nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
          nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
          ]])
      end,
      enabled = conf.enable.lightspeed,
    },

    -- "gc" to comment visual regions/lines
    {
      "numToStr/Comment.nvim",
      event = "BufRead",
      opts = {},
      enabled = conf.enable.Comment,
    },

    -- surround text with ysiw", cs"', ds", etc
    {
      "tpope/vim-surround",
      event = "BufRead",
      enabled = conf.enable.vim_surround,
    },

    -- Telescope
    {
      "nvim-telescope/telescope.nvim",
      event = "BufWinEnter",
      opts = {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
          file_ignore_patterns = {
            "^.git",
            "cscope.out",
            "cscope.files",
            "cscope.in.out",
            "cscope.po.out",
            "*venv*",
            "__pycache__/",
            "*.py[cod]",
            "^.vscode",
            "*.path",
          },
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        },
        extensions = {
          project = {
            base_dirs = { "~/code", max_depth = 3 },
            hidden_files = true,
          },
        },
      },
    },

    --- Telescope on steroids
    {
      "FabianWirth/search.nvim",
      event = "BufWinEnter",
      dependencies = { "nvim-telescope/telescope.nvim" },
      opts = {
        tabs = {
          {
            "Files",
            function()
              require("telescope.builtin").find_files({ hidden = true })
            end,
          },
          {
            "Buffers",
            function()
              require("telescope.builtin").buffers()
            end,
            available = function()
              return #vim.fn.getbufinfo({ buflisted = 1 }) > 0
            end,
          },
          {
            "Recents",
            function()
              require("telescope.builtin").oldfiles({ only_cwd = true })
            end,
          },
          {
            "Search",
            function()
              require("telescope.builtin").live_grep()
            end,
          },
          {
            "Git St",
            function()
              require("telescope.builtin").git_status()
            end,
            available = function()
              vim.fn.system("git rev-parse --show-toplevel")
              return vim.v.shell_error == 0
            end,
          },
        },
      },
    },

    -- Project manager
    {
      "nvim-telescope/telescope-project.nvim",
      event = "BufWinEnter",
      config = function()
        require("telescope").load_extension("project")
      end,
      dependencies = { "nvim-telescope/telescope.nvim" },
      enabled = conf.enable.telescope_project,
    },

    -- Change directory to project root
    {
      "ahmedkhalf/project.nvim",
      event = "BufRead",
      init = function()
        vim.g.nvim_tree_update_cwd = 1
        vim.g.nvim_tree_respect_buf_cwd = 1
      end,
      opts = {},
      enabled = conf.enable.project,
    },

    -- File browser
    {
      "nvim-tree/nvim-tree.lua",
      cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
      opts = {
        git = {
          ignore = false,
        },
        view = {
          side = "right",
        },
      },
      enabled = conf.enable.nvim_tree,
    },

    -- which-key
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {},
    },

    -- Harpoon
    {
      "ThePrimeagen/harpoon",
      enabled = conf.enable.harpoon,
    },

    --* Git *--
    -- Add git related info in the signs columns and popups
    {
      "lewis6991/gitsigns.nvim",
      event = "BufRead",
      opts = {},
      enabled = conf.enable.gitsigns,
    },

    -- Neogit
    {
      "TimUntersberger/neogit",
      cmd = "Neogit",
      opts = {},
      dependencies = { "nvim-lua/plenary.nvim" },
      enabled = conf.enable.neogit,
    },

    {
      "f-person/git-blame.nvim",
      event = "BufRead",
      opts = {
        virtual_text_column = 80,
        highlight_group = "LineNr",
        date_format = "%Y-%m-%d",
        set_extmark_options = { hl_mode = "combine" },
      },
      enabled = conf.enable.git_blame,
    },

    --* Code *--
    -- LSP
    {
      "neovim/nvim-lspconfig",
      lazy = false,
      config = function()
        require("plugin.lsp").setup(conf, conf_file)
      end,
      dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        "williamboman/mason-lspconfig.nvim",

        -- Additional lua configuration, makes nvim stuff amazing
        "folke/neodev.nvim",
      },
      enabled = conf.enable.lsp,
    },

    {
      "williamboman/mason.nvim",
      cmd = "Mason",
      build = ":MasonUpdate",
      opts = {},
    },

    -- Snipets
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      config = function()
        require("luasnip/loaders/from_vscode").lazy_load()
      end,
      dependencies = {
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
      },
      enabled = conf.enable.nvim_cmp,
    },

    -- Autocompletion plugin
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "f3fora/cmp-spell",
        "hrsh7th/cmp-emoji",
      },
      config = function()
        require("plugin.nvim-cmp")
      end,
      enabled = conf.enable.nvim_cmp,
    },

    -- Undotree
    {
      "mbbill/undotree",
      cmd = "UndotreeToggle",
      enabled = conf.enable.undotree,
    },

    -- Treesitter
    {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = conf.treesitter.ensure_installed,
          ignore_install = conf.treesitter.ignore_install,
          highlight = {
            enable = true,
            disable = conf.treesitter.highlight.disable,
          },
        })
      end,
      run = ":TSUpdate",
      enabled = conf.enable.nvim_treesitter,
    },

    {
      "nvim-treesitter/nvim-treesitter-refactor",
      event = "BufRead",
      config = function()
        require("nvim-treesitter.configs").setup({
          refactor = {
            highlight_definitions = { enable = true },
            -- highlight_current_scope = { enable = true },
            smart_rename = {
              enable = true,
              keymaps = {
                smart_rename = "<leader>lR",
              },
            },
            navigation = {
              enable = true,
              keymaps = {
                goto_definition_lsp_fallback = "gd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
              },
            },
          },
        })
      end,
      enabled = conf.enable.nvim_treesitter_refactor and conf.enable.nvim_treesitter,
    },

    {
      "nvim-treesitter/nvim-treesitter-context",
      event = "BufRead",
      opts = {
        max_lines = 5,
      },
      enabled = conf.enable.nvim_treesitter_context and conf.enable.nvim_treesitter,
    },

    -- Code formatter
    {
      "mhartington/formatter.nvim",
      dependencies = {
        "williamboman/mason.nvim",
        opts = {},
      },
      cmd = "Format",
      config = function()
        require("plugin.formatter")
      end,
      enabled = conf.enable.formatter,
    },

    -- Detect indentation
    {
      "tpope/vim-sleuth",
      event = "BufRead",
      enabled = conf.enable.vim_sleuth,
    },

    -- cscope keymaps
    {
      -- dir = "~/code/cscope_maps.nvim",
      "dhananjaylatkar/cscope_maps.nvim",
      ft = { "c", "h", "dashboard" },
      cmd = { "Cscope", "Cstag" },
      keys = "<C-]>",
      opts = {
        cscope = {
          picker = "telescope",
        },
      },
      enabled = conf.enable.cscope_maps,
    },

    {
      "dhananjaylatkar/notes.nvim",
      cmd = { "NotesFind", "NotesGrep", "NotesNew" },
      opts = {},
    },

    {
      "dhananjaylatkar/docgen.nvim",
      cmd = { "DocGen" },
      opts = {},
    },

    {
      "daishengdong/calltree.nvim",
      ft = { "c", "h", "dashboard" },
      opts = {
        prefix = "<leader>c",
        tree_style = "detailed_paths",
      },
    },

    {
      "preservim/vimux",
      event = "BufWinEnter",
      config = function ()
        vim.g.VimuxOrientation = "h"
        vim.g.VimuxHeight = 30
      end
    },

    --* Looks do matter *--
    -- Dev Icons
    {
      "nvim-tree/nvim-web-devicons",
      enabled = conf.enable.nvim_web_devicons,
    },

    -- Hex colors
    {
      "norcalli/nvim-colorizer.lua",
      ft = { "css", "js", "html", "yaml", "yml" },
      cmd = { "ColorizerToggle" },
      opts = { "css", "javascript", "html", "yaml", "yml" },
      enabled = conf.enable.nvim_colorizer,
    },

    {
      "ntpeters/vim-better-whitespace",
      lazy = false,
      config = function()
        vim.g.better_whitespace_enabled = 1
        vim.g.better_whitespace_filetypes_blacklist = { "dashboard" }
      end,
    },

    -- dashboard-nvim
    {
      "glepnir/dashboard-nvim",
      lazy = false,
      config = function()
        require("plugin.dashboard").setup(conf, conf_file)
      end,
      enabled = conf.enable.dashboard,
    },

    -- Statusline
    {
      "hoob3rt/lualine.nvim",
      event = "BufWinEnter",
      config = function()
        require("plugin.lualine").setup(conf, conf_file)
      end,
      enabled = conf.enable.lualine,
    },

    -- Folds
    {
      "kevinhwang91/nvim-ufo",
      dependencies = "kevinhwang91/promise-async",
      event = "BufReadPost",
      config = function()
        require("plugin.ufo").setup(conf, conf_file)
      end,
    },

    {
      "luukvbaal/statuscol.nvim",
      event = "BufReadPost",
      config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
          segments = {
            { text = { "%s" }, click = "v:lua.ScSa" },
            { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          },
        })
      end,
    },

    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPost",
      main = "ibl",
      opts = {
        indent = { char = "│" },
      },
      enabled = conf.enable.indent_blankline,
    },

    {
      "plasticboy/vim-markdown",
      ft = { "md", "markdown" },
      config = function()
        vim.g.vim_markdown_folding_disabled = 1
        vim.g.vim_markdown_conceal = 0

        vim.g.tex_conceal = ""
        vim.g.vim_markdown_math = 1

        vim.g.vim_markdown_frontmatter = 1
        vim.g.vim_markdown_toml_frontmatter = 1
        vim.g.vim_markdown_json_frontmatter = 1
      end,
      enabled = conf.enable.vim_markdown,
    },

    -- Colorschemes
    { "joshdick/onedark.vim" },
    { "sainnhe/gruvbox-material" },
    { "sainnhe/everforest" },
    { "folke/tokyonight.nvim" },
    { "rose-pine/neovim" },
    { "Shatur/neovim-ayu" },
    { "rebelot/kanagawa.nvim" },
    { "arcticicestudio/nord-vim" },
    { "catppuccin/nvim" },
  }
end

local install_lazy = function()
  -- Install lazy.nvim
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

M.setup = function(conf, conf_file)
  install_lazy()
  require("lazy").setup(plugins(conf, conf_file), opts)
end

return M
