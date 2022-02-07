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
	vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

local packer_status, packer = pcall(require, "packer")
if not packer_status then
	return
end
packer.init({
	git = {
		clone_timeout = 600,
	},
})
local plugins = function(use)
	-- Themes
	use("https://git.sr.ht/~leon_plickat/paige")
	use({ "NLKNguyen/papercolor-theme" })
	use("shaunsingh/solarized.nvim")
	use({ "lewis6991/gitsigns.nvim", branch = "main", requires = "nvim-lua/plenary.nvim" })
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({
		"shaunsingh/nord.nvim",
	})
	use({ "dracula/vim", as = "dracula" })
	use("folke/tokyonight.nvim")
	use("Shatur/neovim-ayu")
	use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })

	-- Transparency
	use({
		"xiyaowong/nvim-transparent",
		after = { "nord.nvim", "solarized.nvim", "papercolor-theme", "paige", "dracula", "tokyonight.nvim" },
	})

	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("tiagofumo/vim-nerdtree-syntax-highlight")

	-- Utils
	use({
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
	})
	use({
		"akinsho/bufferline.nvim",
	})
	use({
		"VonHeikemen/searchbox.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
		config = function()
			require("pomodoro").setup({
				time_work = 25,
				time_break_short = 5,
				time_break_long = 20,
				timers_to_long_break = 4,
			})
		end,
	})
	use({
		"wthollingsworth/pomodoro.nvim",
		requires = "MunifTanjim/nui.nvim",
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("space:⋅")
			vim.opt.listchars:append("eol:↴")
			require("indent_blankline").setup({
				use_treesitter = true,
				show_current_context = true,
				show_current_context_start = true,
				filetype_exclude = { "alpha", "minimap", "Trouble", "SidebarNvim", "packer", "fugitive", "NvimTree" },
				buftype_exclude = { "terminal" },
			})
		end,
	})

	-- Beta plugins
	use("nathom/filetype.nvim")
	use({
		"sidebar-nvim/sidebar.nvim",
		config = function()
			local sidebar = require("sidebar-nvim")
			sidebar.setup({
				side = "right",
				open = false,
				update_interval = 100,
				disable_closing_prompt = true,
			})
		end,
	})
	use("lewis6991/impatient.nvim")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({ "mg979/vim-visual-multi", branch = "master" })
	use({
		"iamcco/markdown-preview.nvim",
		ft = { "markdown", "m" },
		run = "cd app && yarn install",
		cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
	})
	use({
		"wfxr/minimap.vim",
		run = "cargo install --locked code-minimap",
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp", branch = "main" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-vsnip", after = "nvim-cmp" },
			{ "hrsh7th/vim-vsnip", after = "nvim-cmp", requires = "hrsh7th/vim-vsnip-integ" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
			{ "kdheepak/cmp-latex-symbols", after = "nvim-cmp" },
			{ "hrsh7th/cmp-calc", after = "nvim-cmp" },
			{ "lukas-reineke/cmp-rg", after = "nvim-cmp" },
			{ "windwp/nvim-autopairs", disable = false },
			{ "lukas-reineke/cmp-under-comparator" },
			{ "hrsh7th/cmp-emoji", after = "nvim-cmp" },
			{
				"uga-rosa/cmp-dictionary",
				after = "nvim-cmp",
				config = function()
					local dict = require("cmp_dictionary")
					dict.setup({
						dic = {
							["*"] = "/usr/share/dict/words",
							["markdown"] = {
								vim.fn.stdpath("config") .. "/" .. "dictionary/american-english",
								vim.fn.stdpath("config") .. "/" .. "dictionary/american-english-lowercase",
								vim.fn.stdpath("config") .. "/" .. "dictionary/american-english-titlecase",
								vim.fn.stdpath("config") .. "/" .. "dictionary/british-english",
								vim.fn.stdpath("config") .. "/" .. "dictionary/british-english-lowercase",
								vim.fn.stdpath("config") .. "/" .. "dictionary/british-english-titlecase",
							},
						},
					})
				end,
			},
		},
	})
	use("nvim-lua/lsp-status.nvim")
	use({
		"andweeb/presence.nvim",
	})
	use("kristijanhusak/orgmode.nvim")
	use({
		"AckslD/nvim-whichkey-setup.lua",
		requires = { "liuchengxu/vim-which-key" },
	})
	use({ "norcalli/nvim-colorizer.lua" })
	use("preservim/nerdcommenter")
	use({ "tpope/vim-fugitive", branch = "master" })
	use("junegunn/vim-easy-align")
	-- use({ "glepnir/dashboard-nvim" })
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		requires = { "tami5/sqlite.lua" },
	})
	use({ "karb94/neoscroll.nvim" })

	use({
		"jpalardy/vim-slime",
		branch = "main",
	})

	-- LSP and syntax highlighting
	-- Because if you are running MS Windows, these plugins won't work :D most of the time
	if vim.fn.getenv("HOME") ~= vim.NIL then
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use({ "nvim-treesitter/playground", after = "nvim-treesitter" })
		use({
			"ttys3/nvim-blamer.lua",
		})
		require("nvim-treesitter.configs").setup({
			yati = { enable = true },
		})
	end

	-- Language Server Protocol Plugins --
	use({ "neovim/nvim-lspconfig", branch = "master" })
	use({ "tami5/lspsaga.nvim", branch = "main", after = "nvim-lspconfig" })
	use({
		"folke/lsp-trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		after = "nvim-lspconfig",
	})
	use("ziglang/zig.vim")
	use({ "onsails/lspkind-nvim", after = "nvim-lspconfig" })
	use({ "kosayoda/nvim-lightbulb", after = "nvim-lspconfig" })

	if packer_bootstrap then
		require("packer").sync()
	end
end

local config = {
	display = {
		open_fn = require("packer.util").float,
	},
	compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
}

return packer.startup({
	plugins,
	config = config,
})
