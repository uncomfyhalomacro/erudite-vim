call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes
Plug 'psliwka/vim-smoothie'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Tools
Plug 'airblade/vim-gitgutter', { 'branch': 'master' }
Plug 'preservim/nerdcommenter'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'

" Markdown preview
Plug 'instant-markdown/vim-instant-markdown', { 'for': 'markdown' }
" Navigation
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Julia
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kdheepak/JuliaFormatter.vim'

"Vim Slime
Plug 'jpalardy/vim-slime', { 'branch': 'main' }

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim', { 'branch': 'master' }


" Completions
Plug 'nvim-lua/completion-nvim'
" Initialize plugins
call plug#end()


let g:slime_target = "kitty"
let g:slime_default_config = {"window_id": 1, "listen_on": $KITTY_LISTEN_ON}
