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
source $HOME/.config/nvim/colorscheme.vim
source $HOME/.config/nvim/lightline.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/lsp.vim
" luafile $HOME/.config/nvim/lua/julia.lua  I plan to learn Lua but not now


set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_popup = 1
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_enable_virtual_text = 0


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
    autocmd FileType json setlocal omnifunc=lua.vim.ls.omnifunc
    autocmd CursorHold * Lspsaga show_line_diagnostics
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
augroup END

augroup LuaLSP
    autocmd!
    autocmd FileType lua setlocal omnifunc=lua.vim.lsp.omnifunc
    autocmd CursorHold * Lspsaga show_line_diagnostics
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
augroup END
