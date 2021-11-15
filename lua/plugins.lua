-- Packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

local packer = require("packer")
packer.init({
	git = {
		clone_timeout = 600,
	},
})

return packer.startup({
	function()
		use("lewis6991/impatient.nvim")
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("nvim-tree").setup({
					update_cwd = true,
					update_focused_file = {
						enable = true,
						update_cwd = true,
					},
					diagnostics = {
						enable = true,
					},
				})
			end,
		})
		use({ "mg979/vim-visual-multi", branch = "master" })
		use({
			"iamcco/markdown-preview.nvim",
			ft = { "markdown", "m" },
			run = "cd app && yarn install",
			cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
			config = [[require('plugin_settings.markdown_preview')]],
		})
		-- Themes
		use({ "NLKNguyen/papercolor-theme", as = "paper2" })
		use({ "uncomfyhalomacro/vim-paper", as = "paper" })
		use("shaunsingh/nord.nvim")
		--use({'YorickPeterse/vim-paper', as = "origpaper" })
		use({ "dracula/vim", as = "dracula" })
		use({
			"xiyaowong/nvim-transparent",
			config = function()
				require("transparent").setup({
					enable = true, -- boolean: enable transparent
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
				vim.g.minimap_auto_start = 0
				vim.g.minimap_auto_start_win_enter = 1
				vim.g.minimap_width = 20
			end,
		})
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/vim-vsnip")
		use("hrsh7th/cmp-nvim-lsp-document-symbol")
		use("hrsh7th/cmp-calc")
		use("lukas-reineke/cmp-rg")
		use("quangnguyen30192/cmp-nvim-ultisnips")
		use("saadparwaiz1/cmp_luasnip")
		use("SirVer/ultisnips")
		use({
			"hrsh7th/nvim-cmp",
			config = function()
				local cmp = require("cmp")

				cmp.setup({
					snippet = {
						expand = function(args)
							-- For `vsnip` user.
							vim.fn["vsnip#anonymous"](args.body)

							-- For `luasnip` user.
							-- require("luasnip").lsp_expand(args.body)

							-- For `ultisnips` user.
							vim.fn["UltiSnips#Anon"](args.body)
						end,
					},
					mapping = {
						["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
						["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
						["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
						["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
						["<C-d>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-e>"] = cmp.mapping.close(),
						["<CR>"] = cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
							select = true,
						}),
					},
					sources = {
						{ name = "nvim_lsp" },

						-- For vsnip user.
						{ name = "vsnip" },

						-- For luasnip user.
						{ name = "cmp_luasnip" },

						-- For ultisnips user.
						{ name = "ultisnips" },

						{ name = "buffer" },

						{ name = "rg" },
						{ name = "calc" },
					},
				})
				require("cmp").setup.cmdline("/", {
					sources = cmp.config.sources({
						{ name = "nvim_lsp_document_symbol" },
					}, {
						{ name = "buffer" },
					}),
				})
			end,
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
		use("ziglang/zig.vim")
		use("onsails/lspkind-nvim")
		use("kosayoda/nvim-lightbulb")

		-- Julia Programming Language Plugins --
		--use({ "JuliaEditorSupport/julia-vim" })
		use({
			"kdheepak/JuliaFormatter.vim",
			run = 'julia --startup-file=no --project=. -e "using Pkg; Pkg.update()"',
			config = [[require('plugin_settings.JuliaFormatter')]],
		})
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	},
})
