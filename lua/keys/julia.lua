local keymap = {}
local project_path = vim.fn.system([[julia --startup-file=no -q -e 'print(dirname(something(Base.current_project(pwd()))))']])
local julia = {
    name = '+julia',
    o = {':!/usr/bin/kitty @new-window --window-type os --cwd=$PWD julia --project='..project_path..'<CR>:<C-[><CR>', 'open julia repl in kitty'},
    r = {':!/usr/bin/kitty @new-window --cwd=$PWD julia --project='..project_path..'<CR>:<C-[><CR> :%SlimeSend<CR>', 'run code from current buffer'}
}

keymap.j = julia
local wk = require('whichkey_setup')
wk.register_keymap('leader', { k = keymap})
