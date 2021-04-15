" Keymaps
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> <C-p> :lua vim.lsp.buf.references()<CR>
nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <localleader>jf :JuliaFormatterFormat<CR>
"nnoremap <silent> <C-t> <cmd>Lspsaga open_floaterm<CR>
"nnoremap <silent> T <cmd>Lspsaga close_floaterm<CR>
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>C :Lspsaga code_action<CR>
vnoremap <silent><leader>C :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent> <C-]> <cmd>Lspsaga diagnostic_jump_next<CR> 
nnoremap <silent> <C-[> <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <C-p> <cmd>Lspsaga preview_definition<CR>

" Navigations
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <leader>m <cmd>NERDTreeToggle<CR><bar><cmd>wincmd p<CR>
"nnoremap <C-m> <cmd>NERDTreeToggle<CR>
"nnoremap <F5> :NERDTreeFind<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space>e :CocCommand explorer --position left<CR>
"autocmd VimEnter * NERDTree | wincmd p

" Markdown
let g:instant_markdown_autostart = 0
nnoremap <silent> <space>m <cmd>InstantMarkdownPreview<CR>
nnoremap <silent>M <cmd>InstantMarkdownStop<CR>

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
" Explorer
"let g:coc_explorer_global_presets = {
"\   'floating': {
"\      'position': 'floating',
"\   },
"\   'floatingLeftside': {
"\      'position': 'floating',
"\      'floating-position': 'left-center',
"\      'floating-width': 30,
"\   },
"\   'floatingRightside': {
"\      'position': 'floating',
"\      'floating-position': 'right-center',
"\      'floating-width': 30,
"\   },
"\   'simplify': {
"\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
"\   }
"\ }
"map <silent> <space>e :CocCommand explorer<CR>
"nnoremap <silent> <leader>e :CocCommand explorer<CR>
"nmap <space>f :CocCommand explorer --preset floatingRightside<CR>
"autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"nmap <space>k <cmd>lua vim.lsp.buf.formatting()<CR>

" Snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
