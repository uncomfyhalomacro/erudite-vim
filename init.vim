filetype plugin on
set hidden
set splitbelow
set tabstop=4
set mouse=nva
set shiftwidth=4
set expandtab
set number
set showtabline=1
set updatetime=100
set backupdir=/home/tricks/.local/share/nvim/backup/,/tmp//
set directory=/home/tricks/.local/share/nvim/swap/,/tmp//
set undodir=/home/tricks/.local/share/nvim/undo/,/tmp//

" Sourcing configurations
source $HOME/.config/nvim/vim-plug.vim
source $HOME/.config/nvim/julia.vim
" luafile $HOME/.config/nvim/lua/julia.lua  I plan to learn Lua but not now

" LSP
" require'lspconfig'.rnix.setup({on_attach=require'completion'.on_attach})
lua << EOF
require'lspconfig'.rust_analyzer.setup({on_attach=require'completion'.on_attach})
require'lspconfig'.julials.setup({
      on_new_config = function(new_config,new_root_dir)
      server_path = "/home/tricks/.julia/packages/LanguageServer/y1ebo/src/"
      cmd = {
        "julia",
        "--project="..server_path,
        "--startup-file=no",
        "--history-file=no",
        "--sysimage=/home/tricks/Developer/Julia/julials.so",
        "--sysimage-native-code=yes",
        "-e", [[
          using Pkg;
          Pkg.instantiate()
          using LanguageServer; using SymbolServer;
          depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
          project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
          # Make sure that we only load packages from this environment specifically.
          @info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
          server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
          server.runlinter = true;
          run(server);
        ]]
    };
    new_config.cmd = cmd
    on_attach=require'completion'.on_attach
    end
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
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> <C-p> :lua vim.lsp.buf.references()<CR>
nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <localleader>jf :JuliaFormatterFormat<CR>
nnoremap <silent> <C-t> <cmd>Lspsaga open_floaterm<CR>
nnoremap <silent> T <cmd>Lspsaga close_floaterm<CR>
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
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

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
" Explorer
let g:coc_explorer_global_presets = {
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 30,
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'right-center',
\      'floating-width': 30,
\   },
\   'simplify': {
\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }
map <silent> <space>e :CocCommand explorer<CR>
nnoremap <silent> <leader>e :CocCommand explorer<CR>
nmap <space>f :CocCommand explorer --preset floatingRightside<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

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

augroup MyCocExplorer
  autocmd!
  autocmd VimEnter * sil! au! FileExplorer *
  autocmd BufEnter * let d = expand('%') | if isdirectory(d) | silent! bd | exe 'CocCommand explorer ' . d | endif
augroup END

augroup MyLSP
    autocmd!
    autocmd FileType julia setlocal omnifunc=lua.vim.lsp.omnifunc
    autocmd FileType python setlocal omnifunc=lua.vim.lsp.omnifunc
    autocmd FileType rust setlocal omnifunc=lua.vim.lsp.omnifunc
    autocmd CursorHold * Lspsaga show_line_diagnostics
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
augroup END

autocmd BufWrite * lua vim.lsp.buf.formatting()
