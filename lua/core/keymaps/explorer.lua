local explorer = {
	name = "+explorer",
	n = { ":enew | startinsert <CR>", "create new file" },
	e = { ":NeoTreeFocusToggle<CR>", "open explorer on the side" },
	z = { ":NeoTreeFloatToggle<CR>", "open explorer float" },
	t = { ":TransparentToggle<CR>", "toggle transparency" }, -- you need exa or just edit it to use ls
	h = { ":Telescope oldfiles<CR>", "recently opened files" },
	b = { ":Telescope marks<CR>", "marks" },
	F = { ":Telescope frecency<CR>", "frequently opened files" },
	f = { ":cd $PWD | Telescope find_files <CR>", "search files" },
	s = { ":SidebarNvimToggle <CR>", "open sidebar" },
	c = { ":Telescope colorscheme <CR>", "select colorscheme" },
	m = { ":MinimapToggle <CR>", "toggle code minimap" },
}

return explorer
