vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local impatient_path=vim.fn.stdpath("data") .. "/site/pack/packer/start/impatient.nvim"
if vim.fn.empty(vim.fn.glob(impatient_path)) < 0 then
	 require('impatient')
end

require('plugins')
--require"packer".compile()
require('settings')

vim.o.guifont="JuliaMono:h10"

if os.getenv("HOME") ~= nil then
	vim.cmd "autocmd BufWinEnter * NvimBlamerAuto"
end

require('language_providers')
require('ayu.colors')
vim.o.background = "dark"
vim.g.transparent_enabled=true
vim.g.presence_auto_update=true
vim.cmd('colorscheme PaperColor')
