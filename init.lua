-- Plugins
require('plugins')

-- LSP
require('lsp')
require('lspsaga.codeaction').code_action()
require('lspsaga.codeaction').range_code_action()

-- Themes
require('colorscheme')

-- Settings 
require('settings')
-- Using vimscript for now
vim.cmd('source ~/.config/nvim/vimscripts/settings.vim')
