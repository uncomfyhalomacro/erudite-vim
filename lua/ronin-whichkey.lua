vim.g.which_key_timeout = 80
vim.g.which_key_use_floating_win = 0
vim.g.which_key_max_size = 0
vim.g.mapleader = ' '
--vim.g.which_key_display_names = {'<CR>', '↵', '<TAB>', '⇆', " ", 'SPC'}
local wk = require('whichkey_setup')
local which_keymap = {}
which_keymap['f'] = {':CocCommand explorer --preset floating<CR>', 'open explorer'}
which_keymap['e'] = {':CocCommand explorer<CR>', 'open explorer on the side'}
which_keymap.s = {
	name = '+session options',
	l = {':SessionLoad<CR>', 'load session'},
	s = {':SessionSave<CR>', 'save session'}
}

local pwd = os.getenv('PWD')

which_keymap.k = {
	name='+kitty terminal',
	s = {':!kitty @ new-window<CR>', 'split-terminal'},
	k = {':!kitty --directory='..pwd..'&<CR>', 'open terminal here'},
	j = {':!kitty @ new-window julia<CR>:<C-[><CR>', 'open julia REPL'},
	l = {':!kitty @ new-window lua<CR>:<C-[><CR>', 'open lua REPL'}
	-- going to add ghpc or whatever haskell
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
