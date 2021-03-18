local pwd = os.getenv('PWD')
local kitty = {
    name = '+terminal',
	k = {':!kitty @new-window --window-type os --cwd $PWD<CR>:<C-[><CR>', 'open terminal here'},
    s = {':!kitty @new-window<CR>:<C-[><CR>', 'split-terminal'},
	-- going to add ghpc or whatever haskell
}

return kitty
