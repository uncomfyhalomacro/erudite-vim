set splitbelow
set tabstop=4
set shiftwidth=4
set expandtab
set number
set updatetime=100

au CursorHold * checktime

autocmd InsertEnter,InsertLeave * set cul!

" Sourcing configurations
source $HOME/.config/nvim/vim-plug.vim
source $HOME/.config/nvim/julia.vim
" luafile $HOME/.config/nvim/lua/julia.lua  I plan to learn Lua but not now

" LSP
lua << EOF
require'lspconfig'.rust_analyzer.setup({on_attach=require'completion'.on_attach})
require'lspconfig'.julials.setup({on_attach=require'completion'.on_attach})
EOF

set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_popup = 1
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_enable_virtual_text = 0

" Keymaps
nnoremap <silent> <C-k> :lua vim.lsp.buf.hover()<CR>
nnoremap <localleader>jf :JuliaFormatterFormat<CR>
nnoremap <silent> <C-t> :sp<bar>terminal<CR>

augroup MyLSP
    autocmd!
    autocmd FileType julia setlocal omnifunc=lua.vim.lsp.omnifunc
    autocmd FileType python setlocal omnifunc=lua.vim.lsp.omnifunc
    autocmd FileType rust setlocal omnifunc=lua.vim.lsp.omnifunc
    autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics() 
augroup END

autocmd BufWrite * lua vim.lsp.buf.formatting()
