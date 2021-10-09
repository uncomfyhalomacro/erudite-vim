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
math.randomseed(os.time())

local footers = {
	"You who have profound knowledge are here to learn and prosper!",
	"Those who know nothing is but a process for those who are curious of the unknown",
	"The present is but a mere reflection of the past and the future",
}

local randomize = math.random(#footers)
vim.g.dashboard_custom_footer = { footers[randomize] }
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
