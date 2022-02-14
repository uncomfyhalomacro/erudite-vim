local wk = require("which-key")
local keymap = {}
local markdown = {
	name = "+markdown",
	p = { ":MarkdownPreview<CR>", "preview on browser" },
	s = { ":MarkdownPreviewStop<CR>", "stop preview" },
	t = { ":MarkdownPreviewToggle<CR>", "toggle preview" },
	m = {
		":!pandoc -V mainfont=\"JuliaMono\" -V \"geometry:margin=.5in\" --wrap=auto --pdf-engine=xelatex -s -o '%:r.pdf' '%'<CR>",
		"save MD to PDF",
	},
}
keymap.m = markdown
wk.register({ ["<leader>"] = keymap })
