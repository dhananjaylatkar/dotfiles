---@diagnostic disable: undefined-global
return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    git = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = {
      enabled = false,
      right = { "git" },
      left = { "sign", "fold" },
      folds = {
        open = true, -- show open fold icons
        git_hl = false, -- use Git Signs hl for fold icons
      },
      git = {
        -- patterns to match Git signs
        patterns = { "GitSign", "MiniDiffSign" },
      },
      refresh = 50, -- refresh at most every 50ms
    },
  },
  keys = {
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Blame",
    },
  },
}
