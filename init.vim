set splitbelow
set tabstop=4
set shiftwidth=4
set expandtab
set number


set omnifunc=v:lua.vim.lsp.omnifunc
autocmd InsertEnter,InsertLeave * set cul!

" Sourcing configurations
source $HOME/.config/nvim/vim-plug.vim
source $HOME/.config/nvim/julia.vim
" luafile $HOME/.config/nvim/lua/julia.lua
lua << EOF
require'lspconfig'.rust_analyzer.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.julials.setup{on_attach=require'completion'.on_attach}
EOF

set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_popup = 1
nnoremap <silent> <C-k> :lua vim.lsp.buf.hover()<CR>
nnoremap <localleader>jf :JuliaFormatterFormat<CR>
autocmd BufWrite * lua vim.lsp.buf.formatting()
