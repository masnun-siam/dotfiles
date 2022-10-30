local M = {}

M.ui = {
	theme_toggle = { "onedark", "one_light" },
	theme = "onedark",
	transparency = true,
}

M.plugins = require("custom.plugins")
-- {
-- 	user = require("custom.plugins"),
-- 	-- override = {
-- 	-- 	["nvim-telescope/telescope.nvim"] = function()
-- 	-- 		require("custom.plugins.telescope")
-- 	-- 	end,
-- 	-- },
-- }

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
