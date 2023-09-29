-- Custom config
local utils = require("utils")
local config, config_file = utils.get_config()

require("plugins").setup(config, config_file)
require("vim_config").setup(config, config_file)
require("keymaps").setup(config, config_file)

local modules = {
  "autocommands",
  "colors." .. config.colorscheme,
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end

-- Overwrite with device specific custom config
if config.custom then
  config.custom()
end
