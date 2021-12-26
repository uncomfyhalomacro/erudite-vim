local keymap = {}
keymap = {
	name = "+tab",
	[","] = { ":BufferLineCyclePrevious<CR>", "previous tab" },
	["."] = { ":BufferLineCycleNext<CR>", "next tab" },
	["<"] = { ":BufferMovePrevious<CR>", "move previous tab" },
	[">"] = { ":BufferMoveNext<CR>", "move next tab" },
	["1"] = { ":BufferLineGoToBuffer 1<CR>", "goto tab 1" },
	["2"] = { ":BufferLineGoToBuffer 2<CR>", "goto tab 2" },
	["3"] = { ":BufferLineGoToBuffer 3<CR>", "goto tab 3" },
	["4"] = { ":BufferLineGoToBuffer 4<CR>", "goto tab 4" },
	["5"] = { ":BufferLineGoToBuffer 5<CR>", "goto tab 5" },
	["6"] = { ":BufferLineGoToBuffer 6<CR>", "goto tab 6" },
	["7"] = { ":BufferLineGoToBuffer 7<CR>", "goto tab 7" },
	["8"] = { ":BufferLineGoToBuffer 8<CR>", "goto tab 8" },
	c = { ":BufferLinePickClose<CR>", "close picked buffer" },
	s = { ":BufferLinePick<CR>", "pickering mode" },
	d = { ":BufferLineSortByDirectory<CR>", "sort by directory" },
	l = { ":BufferOrderByLanguage<CR>", "sort by language" },
}

return keymap
