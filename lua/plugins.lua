-- Packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end


return require('packer').startup(function()
	
	-- packer can manage itself as an optional plugin
    	use {'wbthomason/packer.nvim'}

		-- Themes
        use {'dracula/vim', as = 'dracula', config = require('plugin_settings.dracula')}

        -- Utils
        use 'airblade/vim-gitgutter'
        use {'AckslD/nvim-whichkey-setup.lua', 
        requires = {'liuchengxu/vim-which-key'},
	config = require('plugin_settings.whichkey')
        }
        use 'preservim/nerdcommenter'
		use {'tpope/vim-fugitive', branch = 'master'}
        use 'SirVer/ultisnips'
        use 'honza/vim-snippets'
        use 'junegunn/vim-easy-align'
        use 'junegunn/fzf.vim'
        use {'glepnir/dashboard-nvim', config = require('plugin_settings.dashboard')
        }
        use {'glepnir/galaxyline.nvim', branch = 'main', requires = {'kyazdani42/nvim-web-devicons', opt = true, config = require('plugin_settings.galaxyline')}}
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
        use {'neovim/nvim-lspconfig'}
        use {'glepnir/lspsaga.nvim', branch = 'main', config = require('plugin_settings.lspsaga')}
        use 'onsails/lspkind-nvim'
        use 'kosayoda/nvim-lightbulb'

        -- Julia Programming Language Plugins
        use 'JuliaEditorSupport/julia-vim'
        use 'kdheepak/JuliaFormatter.vim'

        -- COC-neovim
        use {'neoclide/coc.nvim', branch = 'release', config = require('plugin_settings.explorer')}
end)
