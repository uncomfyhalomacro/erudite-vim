-- Packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

local packer = require("packer")
packer.init({
	git = {
		clone_timeout = 600,
	},
})

return packer.startup({
	function()
		use({
			"iamcco/markdown-preview.nvim",
			ft = { "markdown", "m" },
			run = "cd app && yarn install",
			cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
			config = [[require('plugin_settings.markdown_preview')]],
		})
		-- Themes
		use({ "NLKNguyen/papercolor-theme", as = "paper2" })
		use({ "yorickpeterse/vim-paper", as = "paper" })
		use({ "dracula/vim", as = "dracula" })
		use({
			"xiyaowong/nvim-transparent",
			config = function()
				require("transparent").setup({
					enable = false, -- boolean: enable transparent
					exclude = { -- table/string: additional groups that should be clear
						-- In particular, when you set it to 'all', that means all avaliable groups

						-- example of akinsho/nvim-bufferline.lua
						"BufferLineTabClose",
						"BufferlineBufferSelected",
						--"BufferLineFill",
						--"BufferLineBackground",
						"BufferLineSeparator",
						--"BufferLineIndicatorSelected",
					},
					--exclude = {}, -- table: groups you don't want to clear
				})
			end,
		})
		use({
			"lewis6991/impatient.nvim",
			config = function()
				require("impatient").setup()
				require("impatient").enable_profile()
			end,
		})
		use({
			"akinsho/bufferline.nvim",
			config = function()
				require("bufferline").setup()
			end,
		})
		use("folke/tokyonight.nvim")
		use("Shatur/neovim-ayu")
		use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
		use({
			"hoob3rt/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = [[require('plugin_settings.lualine')]],
		})
		use("tiagofumo/vim-nerdtree-syntax-highlight")

		-- Utils
		use({
			"wfxr/minimap.vim",
			run = "cargo install --locked code-minimap",
			config = function()
				vim.g.minimap_auto_start = 1
				vim.g.minimap_auto_start_win_enter = 1
				vim.g.minimap_width = 20
			end,
		})
		use({
			"ms-jpq/coq_nvim",
			branch = "coq",
			config = [[require('plugin_settings.coq_nvim')]],
			run = ":COQdeps",
		}) -- main one
		use({ "ms-jpq/coq.artifacts", branch = "artifacts" }) -- 9000+ Snippets
		use({
			"ms-jpq/chadtree",
			branch = "chad",
			run = "python3 -m chadtree deps",
			requires = { "ryanoasis/vim-devicons", opt = true },
			config = function()
				local chadtree_settings = {
					theme = {
						icon_glyph_set = "devicons",
						text_colour_set = "env",
					},
				}
				vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
			end,
		})
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use("nvim-lua/lsp-status.nvim")
		--use("kyazdani42/nvim-tree.lua")
		use({
			"andweeb/presence.nvim",
			config = function()
				require("presence"):setup({ auto_update = true })
			end,
		})
		use("kristijanhusak/orgmode.nvim")
		--use({ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" }, config = function() end })
		use({
			"AckslD/nvim-whichkey-setup.lua",
			requires = { "liuchengxu/vim-which-key" },
			config = [[require('plugin_settings.whichkey')]],
		})
		use({ "norcalli/nvim-colorizer.lua", config = [[require'colorizer'.setup()]] })
		use("preservim/nerdcommenter")
		use({ "tpope/vim-fugitive", branch = "master" })
		use("junegunn/vim-easy-align")
		use({ "glepnir/dashboard-nvim", config = [[require('plugin_settings.dashboard')]] })
		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		})
		use({ "karb94/neoscroll.nvim", config = [[require('neoscroll').setup()]] })

		use({
			"jpalardy/vim-slime",
			branch = "main",
			config = [[require('plugin_settings.vim-slime')]],
		})

		-- Some stuff I need to disable for now because MS Windows succs
		if os.getenv("HOME") ~= nil then
			use({
				"nvim-treesitter/nvim-treesitter",
				config = [[require('plugin_settings.treesitter')]],
				run = ":TSUpdate",
			})
			use({ "nvim-treesitter/playground" })
			use({
				"ttys3/nvim-blamer.lua",
				config = function()
					require("nvim-blamer").setup({
						enable = true,
						format = "%committer │ %committer-time-human │ %summary",
					})
				end,
			})
		end

		-- Language Server Protocol Plugins --
		use({ "neovim/nvim-lspconfig", branch = "master" })
		use({ "glepnir/lspsaga.nvim", branch = "main", config = [[require('plugin_settings.lspsaga')]] })
		use({
			"folke/lsp-trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("trouble").setup({})
			end,
		})
		--use 'ziglang/zig.vim'
		use("onsails/lspkind-nvim")
		use("kosayoda/nvim-lightbulb")

		-- Julia Programming Language Plugins --
		use({ "JuliaEditorSupport/julia-vim" })
		use({
			"kdheepak/JuliaFormatter.vim",
			run = 'julia --startup-file=no --project=. -e "using Pkg; Pkg.update()"',
			config = [[require('plugin_settings.JuliaFormatter')]],
		})
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
