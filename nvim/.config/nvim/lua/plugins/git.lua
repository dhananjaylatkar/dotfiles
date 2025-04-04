--* Git *--
return {
  -- Neogit
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    -- commit = "bc0c609",
    opts = {
      disable_signs = true,
      integrations = { diffview = true },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    enabled = vim.g.dha.conf.enable.neogit,
  },

  -- Blame line like VSc*de
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    opts = {
      virtual_text_column = 80,
      highlight_group = "LineNr",
      date_format = "%Y-%m-%d",
      set_extmark_options = { hl_mode = "combine" },
    },
    enabled = vim.g.dha.conf.enable.git_blame,
  },

  -- Blame like a pro
  {
    "FabijanZulj/blame.nvim",
    keys = {
      { "<f4>", "<cmd>BlameToggle<cr>" },
    },
    opts = {
      date_format = "%Y-%m-%d",
    },
    enabled = vim.g.dha.conf.enable.blame,
  },

  -- Diffview
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "FileHistory" },
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diff" } },
    config = function()
      local actions = require("diffview.actions")
      require("diffview").setup({
        enhanced_diff_hl = true,
        file_panel = {
          win_config = {
            position = "bottom",
            height = 5,
          },
        },
        keymaps = {
          file_history_panel = {
            {
              "n",
              "q",
              function()
                vim.cmd.DiffviewClose()
              end,
            },
          },
          view = {
            {
              "n",
              "q",
              function()
                vim.cmd.DiffviewClose()
              end,
            },
          },
          file_panel = {
            {
              "n",
              "q",
              function()
                vim.cmd.DiffviewClose()
              end,
            },
            {
              "n",
              "[c",
              actions.view_windo(function(_, sym)
                if sym == "b" then vim.cmd("norm! [c") end
              end),
            },
            {
              "n",
              "]c",
              actions.view_windo(function(_, sym)
                if sym == "b" then vim.cmd("norm! ]c") end
              end),
            },
          },
        },
      })
    end,
  },
}
