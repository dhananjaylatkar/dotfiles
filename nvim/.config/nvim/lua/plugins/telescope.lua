-- Telescope and its extensions

return {
  {
    "nvim-telescope/telescope.nvim",
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
          "Symbols (f)",
          function()
            require("telescope.builtin").treesitter({ symbol_width = 50, symbols = "function" })
          end,
        },
      },
    },
  },

  -- Project manager
  {
    "nvim-telescope/telescope-project.nvim",
    config = function()
      require("telescope").load_extension("project")
    end,
  },
}
