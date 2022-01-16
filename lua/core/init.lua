require("packer_init")
require("packer_compiled")
require("core.settings")
require("core.plugins")
require("core.keymaps")

-- IMPATIENT STARTS HERE --
-- Reporting a startup time of ~3.0 milliseconds --
require("impatient").enable_profile()
vim.o.background = "dark"
vim.g.transparent_enabled = true
vim.g.presence_auto_update = true
vim.o.guifont = "JuliaMono,Hack Nerd Font,Noto Color Emoji:h10"

if os.getenv("HOME") ~= nil then
	vim.cmd("autocmd BufWinEnter * NvimBlamerAuto")
end
