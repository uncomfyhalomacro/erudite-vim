local pwd = os.getenv('PWD')
local kitty = {
    name = '+terminal',
	j = {':!kitty @ new-window julia<CR>:<C-[><CR>', 'open julia REPL'},
	k = {':!kitty --directory='..pwd..'&<CR>', 'open terminal here'},
	l = {':!kitty @ new-window lua<CR>:<C-[><CR>', 'open lua REPL'},
    s = {':!kitty @ new-window<CR>', 'split-terminal'},
	-- going to add ghpc or whatever haskell
}

return kitty
