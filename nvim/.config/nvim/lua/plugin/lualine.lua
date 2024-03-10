-- lualine

local M = {}
local spaces = {
  function()
    local get_opt = vim.api.nvim_get_option_value
    if not get_opt("expandtab", {}) then
      return "Tab Size: " .. get_opt("tabstop", {})
    end
    local size = get_opt("shiftwidth", {})
    if size == 0 then
      size = get_opt("tabstop", {})
    end
    return "Spaces: " .. size
  end,
  cond = function()
    return vim.fn.winwidth(0) > 70
  end,
  color = {},
}
--                                     

M.setup = function(config, _)
  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = config.colorscheme,
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "dashboard" },
      always_divide_middle = true,
      globalstatus = false,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "g:cscope_maps_statusline_indicator", spaces, "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = { "nvim-tree", "quickfix" },
  })
end

return M
