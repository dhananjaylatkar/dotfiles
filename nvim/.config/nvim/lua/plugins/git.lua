--* Git *--
return {
  -- Add git related info in the signs columns and popups
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    opts = {},
    enabled = vim.g.dha.conf.enable.gitsigns,
  },

  -- Neogit
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    commit = "bc0c609",
    opts = {},
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
  },
}
