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
    "nvim-treesitter/nvim-treesitter-refactor",
    event = "BufRead",
    enabled = vim.g.dha.conf.enable.nvim_treesitter_refactor and vim.g.dha.conf.enable.nvim_treesitter,
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
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufRead",
    enabled = vim.g.dha.conf.enable.nvim_treesitter_context and vim.g.dha.conf.enable.nvim_treesitter,
    opts = {
      max_lines = 5,
    },
  },
}
