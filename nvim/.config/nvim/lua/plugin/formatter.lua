-- Code formatter
local util = require("formatter.util")

-- vim.api.nvim_exec(
--   [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.lua FormatWrite
-- augroup END
-- ]],
--   true
-- )

local prettier = function()
  return {
    exe = "prettier",
    args = {
      "--stdin-filepath",
      vim.api.nvim_buf_get_name(0),
      "--single-quote",
    },
    stdin = true,
  }
end

local clang_format = function()
  return {
    exe = "clang-format",
    stdin = true,
  }
end

require("formatter").setup({
  logging = false,
  filetype = {
    javascript = { prettier },
    typescriptp = { prettier },
    jsx = { prettier },
    html = { prettier },
    json = { prettier },
    yaml = { prettier },
    markdown = { prettier },
    cpp = { clang_format },
    c = { clang_format },
    python = {
      -- black
      function()
        return {
          exe = "black",
          stdin = false,
        }
      end,
    },
    lua = {
      -- stylua
      function()
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },
    rust = {
      -- rustfmt
      function()
        return {
          exe = "rustfmt",
          stdin = true,
        }
      end,
    },
  },
})
