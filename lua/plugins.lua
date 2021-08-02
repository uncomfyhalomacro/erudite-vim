-- Packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

local packer = require('packer')
packer.init({
	git = {
		clone_timeout = 600
	}
})

return packer.startup({function()
        use {'iamcco/markdown-preview.nvim',
            ft = {'markdown', 'm'},
            run = 'cd app && yarn install',
            cmd = {'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle'},
            config = [[require('plugin_settings.markdown_preview')]]
        }
		-- Themes
        use {'dracula/vim', as = 'dracula'}
        use 'folke/tokyonight.nvim'
        use 'Shatur/neovim-ayu'
        use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
		use {'hoob3rt/lualine.nvim', 
			requires = {'kyazdani42/nvim-web-devicons', opt = true},
			config = function ()
				require('lualine').setup({
				  options = {
					icons_enabled = true,
					theme = 'gruvbox_light',
					component_separators = {'', ''},
					section_separators = {'', ''},
					disabled_filetypes = {}
				  },
				  sections = {
					lualine_a = {'mode'},
					lualine_b = {'branch'},
					lualine_c = {'filename'},
					lualine_x = {'encoding',
								 'fileformat',
								 'filetype',
								 require('lsp-status').status,
								 require('lsp-status').register_progress,
								 require('lsp-status').diagnostics,
								 require('lsp-status').messages
							 	},
					lualine_y = {'progress'},
					lualine_z = {'location'}
				  },
				  inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {'filename'},
					lualine_x = {'location'},
					lualine_y = {},
					lualine_z = {}
				  },
				  tabline = {
				  },
				  extensions = {'nvim-tree'}				
				})
			end
  			}

        -- Utils
		use 'nvim-lua/lsp-status.nvim'
        use 'kyazdani42/nvim-tree.lua'
        use 'airblade/vim-gitgutter'
        use 'andweeb/presence.nvim'
        use {'ttys3/nvim-blamer.lua',
            config = function ()
            require'nvim-blamer'.setup({
                        enable = true,
                        format = '%committer │ %committer-time-human │ %summary',
            })
            end
        }
        use 'kristijanhusak/orgmode.nvim'
        use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
        use {'AckslD/nvim-whichkey-setup.lua',
            requires = {'liuchengxu/vim-which-key'},
            config = [[require('plugin_settings.whichkey')]]
        }
        use {'norcalli/nvim-colorizer.lua',
            config = [[require'colorizer'.setup()]]
        }
        use 'preservim/nerdcommenter'
        use {'tpope/vim-fugitive', branch = 'master'}
        use 'SirVer/ultisnips'
        use 'honza/vim-snippets'
        use 'junegunn/vim-easy-align'
        use {'glepnir/dashboard-nvim',
            config = [[require('plugin_settings.dashboard')]]
        }
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
        }

        --use {'glepnir/galaxyline.nvim', branch = 'main',
            --requires = {'kyazdani42/nvim-web-devicons', opt = true},
            --config = [[require('plugin_settings.galaxyline')]]
        --}
        use {'karb94/neoscroll.nvim',
            config = [[require('neoscroll').setup()]]
        }
        use {'nvim-lua/completion-nvim',
            config = function ()
                vim.g.completion_enable_auto_hover = 1
                vim.g.completion_enable_auto_popup = 1
				vim.cmd "autocmd BufEnter * lua require'completion'.on_attach()"
            end
        }

        use {'jpalardy/vim-slime', 
            branch = 'main',
            config = [[require('plugin_settings.vim-slime')]]
        }
        use {'nvim-treesitter/nvim-treesitter', config = [[require('plugin_settings.treesitter')]], run = ':TSUpdate'}
        use {'nvim-treesitter/playground'}

		-- Language Server Protocol Plugins --
        use {'neovim/nvim-lspconfig'}
        use {'glepnir/lspsaga.nvim', branch = 'main',
	        config = [[require('plugin_settings.lspsaga')]]
	    }
        use { "folke/lsp-trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup {
            }
            end
        }
        use 'ziglang/zig.vim'
        use 'onsails/lspkind-nvim'
        use 'kosayoda/nvim-lightbulb'

        -- Julia Programming Language Plugins --
        use {'JuliaEditorSupport/julia-vim'}
        use {'kdheepak/JuliaFormatter.vim', config = [[require('plugin_settings.JuliaFormatter')]]}
end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})
