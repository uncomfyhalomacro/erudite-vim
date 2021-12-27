local markdown = {
	name = "+markdown",
	p = { ":MarkdownPreview<CR>", "preview on browser" },
	s = { ":MarkdownPreviewStop<CR>", "stop preview" },
	t = { ":MarkdownPreviewToggle<CR>", "toggle preview" },
	m = { ":!pandoc --wrap=auto --pdf-engine=xelatex -s -o %:r.pdf %<CR>", "save MD to PDF" },
}

local keymap = {}
keymap.m = markdown
local wk = require("whichkey_setup")
wk.register_keymap("leader", keymap)
