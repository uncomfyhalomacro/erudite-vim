local keymap = {}
local julia = {
    name = '+julia',
    o = {':!/usr/bin/kitty @new-window --window-type os --cwd=$PWD julia<CR>:<C-[><CR>', 'open julia repl in kitty'},
    r = {':!/usr/bin/kitty @new-window --cwd=$PWD julia<CR>:<C-[><CR> :%SlimeSend<CR>', 'run code from current buffer'}
}

keymap.j = julia
local wk = require('whichkey_setup')
wk.register_keymap('leader', { k = keymap})
