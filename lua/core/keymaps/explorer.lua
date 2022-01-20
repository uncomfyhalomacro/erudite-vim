local explorer = {
	name = "+explorer",
	n = { ":enew | startinsert <CR>", "create new file" },
	e = { ":NvimTreeToggle<CR>", "open explorer" },
	t = { ":vsplit term://exa -aT<CR>:<C-[>", "show directory tree" }, -- you need exa or just edit it to use ls
	h = { ":Telescope oldfiles<CR>", "find file" },
  b = { ":Telsecope marks<CR>", "marks"}
}

return explorer
