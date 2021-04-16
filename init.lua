-- Plugins
require('plugins')
require('language_providers')
require('ronin-explorer')
require('ronin-whichkey')

-- LSP
require('lsp')
require('lspsaga').init_lsp_saga()
require('lspsaga.codeaction').code_action()
require('lspsaga.codeaction').range_code_action()

-- FileTypes
-- require('ftplugin') --sadly not ported to lua yet

-- Themes
require('colorscheme')
require('ronin-galaxy')
local heads = require('headers')

-- Settings
require('settings')


-- Using vimscript for now. This will be moved to settings or their own lua file
vim.cmd('source ~/.config/nvim/vimscripts/settings.vim')

-- Dashboard Theme
math.randomseed(os.time()) --seed it
vim.g.dashboard_custom_header = heads.headers[math.random(#heads.headers)]
vim.g.dashboard_custom_footer = {"Welcome "..os.getenv('USER')..". Ready for some adventure?","  Date: "..os.date()}
