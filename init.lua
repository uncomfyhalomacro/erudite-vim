require('plugins')
require('settings')

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"
vim.cmd "autocmd BufWinEnter * NvimBlamerAuto"
require('language_providers')
require('plugin_settings.colorscheme')
