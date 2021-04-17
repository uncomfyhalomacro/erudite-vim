vim.g.which_key_timeout = 80
vim.g.which_key_use_floating_win = 0
vim.g.which_key_max_size = 0
vim.g.mapleader = ' '

local wk = require('whichkey_setup')
local keymap = {}

local explorer_key = require('keys.explorer')
local kitty_key = require('keys.kitty')

local sessions = {
    name = '+sessions';
    s = {':SessionSave<CR>', 'save current session'};
    l = {':SessionLoad<CR>', 'load last session'}
}

keymap['e'] = {':CocCommand explorer<CR>', 'open explorer on the side'}
keymap.f = explorer_key
keymap.k = kitty_key
keymap.s = sessions
keymap.c = { name = "+NerdCommenter" }
keymap.h = { name = "+GitGutter" }
keymap.a = {
    name = '+code action';
    a = {':Lspsaga code_action<CR>', 'code action'};
    r = {':<C-U>Lspsaga range_code_action<CR>', 'ranged code action'}
}

wk.config{
	hide_statusline = true,
    default_keymap_settings = {
        silent=true,
        noremap=true,
    },
}
wk.register_keymap('leader', keymap)
