require("bufferline").setup({
	options = {
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "center",
			},
			{
				filetype = "SidebarNvim",
				text = "Sidebar",
				highlight = "SidebarNvimKeyword",
				text_align = "center",
			},
			{
				filetype = "minimap",
				text = "Code Minimap",
				highlight = "Directory",
				text_align = "center",
			},
			{
				filetype = "alpha",
				text = "Welcome, Traveler",
				highlight = "Directory",
				text_align = "center",
			},
		},
	},
})
