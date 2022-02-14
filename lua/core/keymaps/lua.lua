-- TODO make it dynamic with tmux or kitty
local wk = require("which-key")
local keymap = {}
local lua = {
	name = "+lua",
	o = { ":!kitty @new-window --cwd='%:p:h' lua<CR>:<C-[><CR>", "open lua repl in kitty" },
	r = { ":!kitty @new-window --cwd='%:p:h' lua<CR>:<C-[><CR>:%SlimeSend<CR>", "run code from current buffer" },
}
keymap.l = lua
wk.register({ ["<leader>k"] = keymap })
