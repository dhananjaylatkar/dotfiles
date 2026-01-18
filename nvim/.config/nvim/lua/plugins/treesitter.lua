-- Treesitter
return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    run = ":TSUpdate",
    enabled = vim.g.dha.conf.enable.nvim_treesitter,
    config = function()
      local langs = vim.g.dha.conf.ts.langs
      -- install the parsers
      require("nvim-treesitter").install(langs)
      -- enable TS
      vim.api.nvim_create_autocmd("FileType", {
        pattern = langs,
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufRead",
    enabled = vim.g.dha.conf.enable.nvim_treesitter_context,
    opts = {
      multiwindow = true,
      max_lines = 5,
    },
  },
}
