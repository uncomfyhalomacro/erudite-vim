vim.g.which_key_timeout = 100
vim.g.which_key_use_floating_win = 0
vim.g.which_key_max_size = 0
vim.g.mapleader = ' '
vim.g.which_key_hspace = 5
vim.g.which_key_vertical = 0
vim.g.which_key_sort_horizontal = 0
vim.g.which_key_flatten = 0


vim.g.which_key_fallback_to_native_key = 1
vim.g.which_key_display_names = {
    ['<CR>'] = '↵',
    ['<TAB>'] = '⇆',
    ['<LEADER>'] = '異'
}

vim.g.which_key_sep = '→'
vim.g.which_key_timeout = 100

local wk = require('whichkey_setup')
local keymap = {}

-- Basic stuff
keymap.q = { ':q<CR>', 'exit buffer'}

keymap.w = { ':w<CR>', 'write buffer to file' }
----
local explorer_key = require('keys.explorer')
local kitty_key = require('keys.kitty')

local sessions = {
    name = '+sessions';
    s = {':SessionSave<CR>', 'save current session'};
    l = {':SessionLoad<CR>', 'load last session'}
}

keymap.f = explorer_key
keymap.k = kitty_key
keymap.s = sessions
keymap.c = { name = "+NerdCommenter" }
keymap.h = { name = "+GitGutter" }
keymap.a = {
    name = '+code';
    a = {':Lspsaga code_action<CR>', 'code action'};
    r = {':<C-U>Lspsaga range_code_action<CR>', 'ranged code action'}
}
keymap.A = require('keys.barbar')
keymap.d = {
	name = '+dashboard',
	h = {':DashboardFindHistory<CR>', 'browse history'},
	d = {':Dashboard<CR>', 'main menu'},
	m = {':DashboardJumpMarks<CR>', 'jump marks' },
	w = {':DashboardFindWord<CR>', 'find word'},
	c = {':DashboardChangeColorscheme<CR>', 'change colorscheme'}
}

keymap['t'] = {':TSPlaygroundToggle<CR>', 'treesitter playground'}

-- FileTypes

vim.cmd "autocmd FileType julia :lua require('keys.julia')"
vim.cmd "autocmd FileType lua :lua require('keys.lua')"
vim.cmd "autocmd FileType markdown :lua require('keys.markdown')"
vim.cmd "autocmd FileType tex :lua require('keys.texlab')"
vim.cmd "autocmd FileType bib :lua require('keys.texlab')"

wk.config{
	hide_statusline = true,
    default_keymap_settings = {
        silent=true,
        noremap=true,
    },
}

wk.register_keymap('leader', keymap)
