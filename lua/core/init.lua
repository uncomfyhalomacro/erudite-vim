require("packer_init")
require("impatient").enable_profile()
require("packer_compiled")
require("core.settings")
require("core.plugins")
require("core.keymaps") -- keymaps should always be last

-- IMPATIENT STARTS HERE --
-- Reporting a startup time of less than 3.0 milliseconds --
vim.o.background = "light"
vim.cmd("colorscheme gruvbox")
vim.g.transparent_enabled = false
vim.g.presence_auto_update = true
vim.o.guifont = "JuliaMono,Hack Nerd Font,Noto Color Emoji:h10"
