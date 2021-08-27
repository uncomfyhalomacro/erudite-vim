local wk = require("whichkey_setup")
local keymap = {}
keymap = {
	name = "+tab",
	[","] = { ":BufferPrevious<CR>", "previous tab" },
	["."] = { ":BufferNext<CR>", "next tab" },
	["<"] = { ":BufferMovePrevious<CR>", "move previous tab" },
	[">"] = { ":BufferMoveNext<CR>", "move next tab" },
	["1"] = { ":BufferGoto 1<CR>", "goto tab 1" },
	["2"] = { ":BufferGoto 2<CR>", "goto tab 2" },
	["3"] = { ":BufferGoto 3<CR>", "goto tab 3" },
	["4"] = { ":BufferGoto 4<CR>", "goto tab 4" },
	["5"] = { ":BufferGoto 5<CR>", "goto tab 5" },
	["6"] = { ":BufferGoto 6<CR>", "goto tab 6" },
	["7"] = { ":BufferGoto 7<CR>", "goto tab 7" },
	["8"] = { ":BufferGoto 8<CR>", "goto tab 8" },
	["9"] = { ":BufferLast<CR>", "last tab" },
	c = { ":BufferClose<CR>", "close current tab" },
	s = { ":BufferPick<CR>", "pickering mode" },
	d = { ":BufferOrderByDirectory<CR>", "sort by directory" },
	l = { ":BufferOrderByLanguage<CR>", "sort by language" },
}

return keymap
