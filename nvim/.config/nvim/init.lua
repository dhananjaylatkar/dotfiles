-- Custom config
local _ok, config_user = pcall(require, "config")
if _ok then
	local config_default = require("config_default")
	CONFIG = vim.tbl_deep_extend("force", config_default, config_user)
	CONFIG_FILE = "config.lua"
else
	CONFIG = require("config_default")
	CONFIG_FILE = "config_default.lua"
end

local modules = {
	"plugins",
	"vim_config",
	"autocommands",
	"colors."..CONFIG.colorscheme,
}
for _, module in ipairs(modules) do
	local ok, err = pcall(require, module)
	if not ok then
		error("Error loading " .. module .. "\n\n" .. err)
	end
end
