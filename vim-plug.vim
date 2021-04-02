call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes
Plug 'psliwka/vim-smoothie'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'preservim/nerdcommenter'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
" Navigation
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Julia
Plug 'JuliaEditorSupport/julia-vim'
Plug 'kdheepak/JuliaFormatter.vim'

" Themes
" Plug 'dracula/vim', { 'as': 'dracula' }

" Completions
Plug 'nvim-lua/completion-nvim'
" Initialize plugins
call plug#end()
