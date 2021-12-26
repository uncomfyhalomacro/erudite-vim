local markdown = {
	name = "+markdown",
	p = { ":MarkdownPreview<CR>", "preview on browser" },
	s = { ":MarkdownPreviewStop<CR>", "stop preview" },
	t = { ":MarkdownPreviewToggle<CR>", "toggle preview" },
	m = { ":!pandoc -s -o %:r.pdf %<CR>", "save MD to PDF" },
}

return markdown
