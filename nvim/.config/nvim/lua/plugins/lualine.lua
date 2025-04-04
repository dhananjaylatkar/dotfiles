-- Statusline

local spaces = {
  function()
    local get_opt = vim.api.nvim_get_option_value
    if not get_opt("expandtab", {}) then return "T:" .. get_opt("tabstop", {}) end

    local size = get_opt("shiftwidth", {})
    if size == 0 then size = get_opt("tabstop", {}) end
    return "S:" .. size
  end,
  cond = function()
    return vim.fn.winwidth(0) > 70
  end,
  color = {},
}
--                                     
return {
  "hoob3rt/lualine.nvim",
  event = "BufWinEnter",
  enabled = vim.g.dha.conf.enable.lualine,
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "ministarter" },
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "g:cscope_maps_statusline_indicator", spaces, { "filetype", icon_only = true } },
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
  end,
}
