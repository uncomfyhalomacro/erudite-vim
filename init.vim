set splitbelow
set tabstop=4
set shiftwidth=4
set expandtab
set number
set updatetime=100

"au CursorHold * checktime

autocmd InsertEnter,InsertLeave * set cul!

" Sourcing configurations
source $HOME/.config/nvim/vim-plug.vim
source $HOME/.config/nvim/julia.vim
" luafile $HOME/.config/nvim/lua/julia.lua  I plan to learn Lua but not now

" LSP
lua << EOF
require'lspconfig'.rust_analyzer.setup({on_attach=require'completion'.on_attach})
require'lspconfig'.julials.setup({
cmd = { 
    "julia",
    "--project=/home/tricks/.julia/packages/LanguageServer/y1ebo/src",
    "--startup-file=no", 
    "--history-file=no",
    "--sysimage=/home/tricks/JuliaLS/languageserver.so",
    "--sysimage-native-code=yes",
    "/home/tricks/JuliaLS/languageserver.jl"
     };
})

require('lspsaga.codeaction').code_action()
require('lspsaga.codeaction').range_code_action()
EOF

set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_popup = 1
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_enable_virtual_text = 0

" Keymaps
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> <C-p> :lua vim.lsp.buf.references()<CR>
nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <localleader>jf :JuliaFormatterFormat<CR>
nnoremap <silent> <C-t> :sp<bar>terminal<CR>
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent> <C-[> <cmd>Lspsaga diagnostic_jump_next<CR> 
nnoremap <silent> <C-[> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-k> <cmd>Lspsaga preview_definition<CR>

augroup MyLSP
    autocmd!
    autocmd FileType julia setlocal omnifunc=lua.vim.lsp.omnifunc
    autocmd FileType python setlocal omnifunc=lua.vim.lsp.omnifunc
    autocmd FileType rust setlocal omnifunc=lua.vim.lsp.omnifunc
    "autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
    "autocmd CursorMoved * :Lspsaga hover_doc
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
augroup END

autocmd BufWrite * lua vim.lsp.buf.formatting()
