-- Treesitter
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    run = ":TSUpdate",
    enabled = vim.g.dha.conf.enable.nvim_treesitter,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = vim.g.dha.conf.treesitter.ensure_installed,
        ignore_install = vim.g.dha.conf.treesitter.ignore_install,
        highlight = {
          enable = true,
          disable = vim.g.dha.conf.treesitter.highlight.disable,
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufRead",
    enabled = vim.g.dha.conf.enable.nvim_treesitter_context and vim.g.dha.conf.enable.nvim_treesitter,
    opts = {
      multiwindow = true,
      max_lines = 5,
    },
  },
}
