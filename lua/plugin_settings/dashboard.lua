vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_section = {
	last_session = {
		description = { " Load Last Session        SPC s l" },
		command = "SessionLoad",
	},
	newfile = {
		description = { " New File                 SPC f n" },
		command = "DashboardNewFile",
	},
	findfile = {
		description = { " Find File                SPC f f" },
		command = "DashboardFindFile",
	},
	history = {
		description = { " History                  SPC d h" },
		command = "DashboardFindHistory",
	},
	coc_explorer = {
		description = { " Open File Explorer       SPC f e" },
		command = "CHADopen",
	},
}

-- Set autosave last session
vim.cmd("autocmd BufWritePost * silent! SessionSave")
vim.g.dashboard_custom_header = require("headers")
vim.g.dashboard_custom_footer = { "You who have profound knowledge are here to learn and prosper!" }
--if os.getenv("HOME") == nil then
	--vim.g.dashboard_custom_footer = {
		--"   Welcome " .. os.getenv("USERNAME") .. ". Ready for some adventure?",
		--"     			Date: " .. os.date(),
	--}
--else
	--vim.g.dashboard_custom_footer = {
		--"   Welcome " .. os.getenv("USER") .. ". Ready for some adventure?",
		--"     Date: " .. os.date(),
	--}
--end
