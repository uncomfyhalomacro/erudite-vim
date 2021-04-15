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
        --use 'itchyny/lightline.vim'

        -- Utils
        use 'airblade/vim-gitgutter'
        use 'preservim/nerdcommenter'
		use {'tpope/vim-fugitive', branch = 'master'}
        use 'SirVer/ultisnips'
        use 'honza/vim-snippets'
        use 'junegunn/vim-easy-align'
        use 'junegunn/fzf.vim'
        use {'glepnir/dashboard-nvim', config = function ()
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

                },
                coc_explorer = {
                    description = {" Open File Explorer       SPC f"},
                    command = 'CocCommand explorer --preset floating'
                }
            }
        end}
        use {'glepnir/galaxyline.nvim', branch = 'main', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
        use 'psliwka/vim-smoothie' -- for smooth scrolling
        use {'nvim-lua/completion-nvim', config = function ()
            vim.g.completion_enable_auto_hover = 1
            vim.g.completion_enable_auto_popup = 1
        end}

        use {'jpalardy/vim-slime', branch = 'main', config = function ()
            vim.g.slime_target = "kitty"
            vim.g.slime_default_config = {window_id= 1, listen_on= os.getenv('KITTY_LISTEN_ON')}

        end}
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
