require('plugins')
require('settings')
vim.o.guifont="JuliaMono:h10"
if os.getenv("HOME") ~= nil then
	vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"
	vim.cmd "autocmd BufWinEnter * NvimBlamerAuto"
end
require('language_providers')
require('ayu.colors')
vim.o.background = "dark"
vim.cmd('colorscheme PaperColor')
