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

-- Dashboard Theme
-- ugly though. I should create a predetermined color in the future
--vim.g.dashboard_preview_command = 'lolcat --spread=2.0 --seed=23'
--vim.g.dashboard_preview_file = '~/.config/nvim/dashboardlogo.cat'
--vim.g.dashboard_preview_file_height = 15
--vim.g.dashboard_preview_file_width = 95


