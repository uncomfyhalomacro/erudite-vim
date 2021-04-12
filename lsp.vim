" LSP

lua require('lsp')

" I am going to convert my configs to lua but after exams lol
lua << EOF
require('lspsaga.codeaction').code_action()
require('lspsaga.codeaction').range_code_action()
EOF
