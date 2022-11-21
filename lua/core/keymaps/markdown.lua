local wk = require("which-key")
local keymap = {}
local markdown = {
    name = "+markdown",
    p = { ":MarkdownPreview<CR>", "preview on browser" },
    s = { ":MarkdownPreviewStop<CR>", "stop preview" },
    t = { ":MarkdownPreviewToggle<CR>", "toggle preview" },
    m = {
        ':!pandoc -V mainfont="JuliaMono" -V "fontsize=10pt" -V "geometry:margin=.10in" -V "papersize:a4"  --wrap=auto --pdf-engine=xelatex -s -o \'%:r.pdf\' \'%\'<CR>',
        "save MD to PDF",
    },
}
keymap.m = markdown
wk.register({ ["<leader>"] = keymap })
