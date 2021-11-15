-- INIT --
require("plugins")
require("settings")
require("packer_compiled")

-- IMPATIENT STARTS HERE --
-- Reporting a startup time of ~3.0 milliseconds --
require("impatient").enable_profile()
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require("language_providers")
require("ayu.colors")
vim.o.background = "dark"
vim.g.transparent_enabled = true
vim.g.presence_auto_update = true
vim.cmd("colorscheme PaperColor")
vim.o.guifont = "JuliaMono:h10"

if os.getenv("HOME") ~= nil then
	vim.cmd("autocmd BufWinEnter * NvimBlamerAuto")
end
