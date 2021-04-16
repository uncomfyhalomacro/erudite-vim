vim.g.which_key_timeout = 100
vim.g.which_key_use_floating_win = 0
vim.g.which_key_max_size = 0
vim.g.mapleader = ' '

local wk = require('whichkey_setup')
local which_keymap = {}
which_keymap['f'] = {':CocCommand explorer --preset floating<CR>', 'open explorer'}
which_keymap['e'] = {':CocCommand explorer<CR>', 'open explorer on the side'}
which_keymap.s = {
	name = '+session options',
	l = {':SessionLoad<CR>', 'load session'},
	s = {':SessionSave<CR>', 'save session'}
}

-- Remove statusline when whichkeying
wk.config{
	hide_statusline = true,
    default_keymap_settings = {
        silent=true,
        noremap=true,
    },
}
wk.register_keymap('leader', which_keymap)
