-- Custom config
if pcall(require, "config") then
  CONFIG = require("config")
  CONFIG_FILE = "config.lua"
else
  CONFIG = require("config_default")
  CONFIG_FILE = "config_default.lua"
end

-- Packer config
require("plugins")

-- Vim config
require("vim_config")

-- Utils
require("utils")

-- Colorschems
require("plugin.colors").setup(CONFIG.colorscheme)
