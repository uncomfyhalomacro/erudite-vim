-- Packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

local my = function(file) require(file) end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').init({display = {auto_clean = false}})

-- Initialize plugins

return require('packer').startup(function()
		-- Themes
		use {'dracula/vim', as = 'dracula'}
		use 'itchyny/lightline.vim'

		-- Utils
		use 'airblade/vim-gitgutter'
		use 'preservim/nerdcommenter'
		use 'SirVer/ultisnips'
		use 'honza/vim-snippets'
		use 'junegunn/vim-easy-align'
        use 'junegunn/fzf.vim'
        use {'glepnir/dashboard-nvim', config = function (dash)
            vim.g.dashboard_default_executive = "fzf"
            vim.g.dashboard_custom_section = {
                last_session = {
                    description = {" Load Last Session        SPC l"},
                    command = 'SessionLoad'
                },
                newfile = {
                    description = {" New File                 SPC n"},
                    command = 'DashboardNewFile'
                },
                findfile = {
                    description = {" Find File                SPC F"},
                    command = 'DashboardFindFile'
                },
                history = {
                    description = {" History                  SPC h"},
                    command = 'DashboardFindHistory'

                }
            }
            vim.cmd('highlight dashboardHeader ctermfg=86')
            vim.cmd('highlight dashboardFooter ctermfg=190')
            vim.cmd('highlight dashboardCenter ctermfg=99')
        end
        }
		use 'psliwka/vim-smoothie' -- for smooth scrolling
		use 'nvim-lua/completion-nvim'
        use {'jpalardy/vim-slime', branch = 'main'}
        use {'instant-markdown/vim-instant-markdown', ft = {'markdown'}}
        use {'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate'}

		-- Language Server Protocol Plugins
		use 'neovim/nvim-lspconfig'
		use 'glepnir/lspsaga.nvim'
		use 'onsails/lspkind-nvim'
		use 'kosayoda/nvim-lightbulb'
        
		-- Julia Programming Language Plugins
		use 'JuliaEditorSupport/julia-vim'
		use 'kdheepak/JuliaFormatter.vim'

		-- COC-neovim
		use {'neoclide/coc.nvim', branch = 'release'}
end)
