-- Code formatter
require("formatter").setup({
  logging = false,
  filetype = {
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
          stdin = true,
        }
      end,
    },
    python = {
      -- yapf
      function()
        return {
          exe = "yapf",
          stdin = true,
        }
      end,
    },
    lua = {
      -- stylua
      function()
        return {
          exe = "stylua",
          args = {
            vim.api.nvim_buf_get_name(0),
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--quote-style",
            "AutoPreferDouble",
          },
          stdin = false,
        }
      end,
    },
  },
})
