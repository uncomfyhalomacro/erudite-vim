local lua = {
    name = '+lua',
    o = {'!kitty @new-window --cwd=%:p:h lua<CR>:<C-[><CR>', 'open lua repl in kitty'},
    r = {':!kitty @new-window --cwd=%:p:h lua<CR>:<C-[><CR>:%SlimeSend<CR>', 'run code from current buffer'}
}

local keymap = {}
keymap.l = lua
local wk = require('whichkey_setup')
wk.register_keymap('leader', { k = keymap })
