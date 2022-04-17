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
	-- To manage itself
	use({ "wbthomason/packer.nvim" })

	-- Themes
	use("https://git.sr.ht/~leon_plickat/paige")
	use({ "NLKNguyen/papercolor-theme" })
	use("shaunsingh/solarized.nvim")
	use({ "lewis6991/gitsigns.nvim", branch = "main", requires = "nvim-lua/plenary.nvim" })
	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		-- config = function()
		-- 	local catppuccin = require("catppuccin")
		-- 	local transparency = vim.g.transparent_enabled
		-- 	catppuccin.setup({
		-- 		transparent_background = transparency,
		-- 		which_key = true,
		-- 		nvimtree = {
		-- 			enabled = true,
		-- 			show_root = not transparency, -- makes the root folder not transparent
		-- 			transparent_panel = transparency, -- make the panel transparent
		-- 		},
		-- 	})
		-- end,
	})
	use({ "shaunsingh/nord.nvim" })
	use({ "dracula/vim", as = "dracula" })
	use("folke/tokyonight.nvim")
	use("Shatur/neovim-ayu")
	use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
	use({ "projekt0n/github-nvim-theme" })

	-- Transparency
	use({
		"xiyaowong/nvim-transparent",
	})

	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("tiagofumo/vim-nerdtree-syntax-highlight")

	-- Utils
	use({
		"Shatur/neovim-session-manager",
		commit = "2d42185c859907ab600dd2d0ebd8d1764eec5b58",
		config = function()
			require("session_manager").setup({
				autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
			})
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})
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
	})
	use({
		"wthollingsworth/pomodoro.nvim",
		requires = "MunifTanjim/nui.nvim",
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
	use({
		"mickael-menu/zk-nvim",
		config = function()
			require("zk").setup({
				picker = "telescope",
			})
		end,
	})
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
	use({
		"DanilaMihailov/beacon.nvim",
		config = function()
			vim.g.beacon_enable = true
			vim.g.beacon_ignore_filetypes = { "fzf", "NvimTree" }
			vim.cmd([[
        augroup MyCursorLineGroup
            autocmd!
            au WinEnter * setlocal cursorline
            au WinLeave * setlocal nocursorline
        augroup end
      ]])
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
			{ "uncomfyhalomacro/cmp-latex-symbols", after = "nvim-cmp", run = "cargo run --release" },
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
		"folke/which-key.nvim",
		config = function()
			vim.g.mapleader = " "
			vim.g.maplocalleader = "\\"
			require("which-key").setup({
				plugins = {
					marks = true, -- shows a list of your marks on ' and `
					registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
					spelling = {
						enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
						suggestions = 20, -- how many suggestions should be shown in the list?
					},
					-- the presets plugin, adds help for a bunch of default keybindings in Neovim
					-- No actual key bindings are created
					presets = {
						operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
						motions = true, -- adds help for motions
						text_objects = true, -- help for text objects triggered after entering an operator
						windows = true, -- default bindings on <c-w>
						nav = true, -- misc bindings to work with windows
						z = true, -- bindings for folds, spelling and others prefixed with z
						g = true, -- bindings for prefixed with g
					},
				},
				-- add operators that will trigger motion and text object completion
				-- to enable all native operators, set the preset / operators plugin above
				operators = { gc = "Comments" },
				key_labels = {
					-- override the label used to display some keys. It doesn't effect WK in any other way.
					-- For example:
					-- ["<space>"] = "SPC",
					-- ["<cr>"] = "RET",
					-- ["<tab>"] = "TAB",
				},
				icons = {
					breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
					separator = "➜", -- symbol used between a key and it's label
					group = "+", -- symbol prepended to a group
				},
				popup_mappings = {
					scroll_down = "<c-d>", -- binding to scroll down inside the popup
					scroll_up = "<c-u>", -- binding to scroll up inside the popup
				},
				window = {
					border = "single", -- none, single, double, shadow
					position = "bottom", -- bottom, top
					margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
					padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
					winblend = 0,
				},
				layout = {
					height = { min = 4, max = 25 }, -- min and max height of the columns
					width = { min = 20, max = 200 }, -- min and max width of the columns
					spacing = 25, -- spacing between columns
					align = "center", -- align columns left, center or right
				},
				ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
				hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
				show_help = true, -- show help message on the command line when the popup is visible
				triggers = { "<leader>", "<localleader>", "g", "<Shift>", "[", "]" }, -- automatically setup triggers
				-- triggers = {"<leader>"} -- or specify a list manually
				triggers_blacklist = {
					-- list of mode / prefixes that should never be hooked by WhichKey
					-- this is mostly relevant for key maps that start with a native binding
					-- most people should not need to change this
					i = { "j", "k" },
					v = { "j", "k" },
				},
			})
		end,
	})
	use({ "norcalli/nvim-colorizer.lua" })
	use({
		"numToStr/Comment.nvim",
		commit = "0aaea32f27315e2a99ba4c12ab9def5cbb4842e4",
		config = function()
			require("Comment").setup({
				---Add a space b/w comment and the line
				---@type boolean
				padding = true,

				---Whether the cursor should stay at its position
				---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
				---@type boolean
				sticky = true,

				---Lines to be ignored while comment/uncomment.
				---Could be a regex string or a function that returns a regex string.
				---Example: Use '^$' to ignore empty lines
				---@type string|fun():string
				ignore = nil,

				---LHS of toggle mappings in NORMAL + VISUAL mode
				---@type table
				toggler = {
					---Line-comment toggle keymap
					line = "<localleader>cc",
					---Block-comment toggle keymap
					block = "<localleader>bc",
				},

				---LHS of operator-pending mappings in NORMAL + VISUAL mode
				---@type table
				opleader = {
					---Line-comment keymap
					line = "<localleader>c",
					---Block-comment keymap
					block = "<localleader>b",
				},

				---LHS of extra mappings
				---@type table
				extra = {
					---Add comment on the line above
					above = "<localleader>cO",
					---Add comment on the line below
					below = "<localleader>co",
					---Add comment at the end of line
					eol = "<localleader>cA",
				},

				---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
				---@type table
				mappings = {
					---Operator-pending mapping
					---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
					---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
					basic = true,
					---Extra mapping
					---Includes `gco`, `gcO`, `gcA`
					extra = true,
					---Extended mapping
					---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
					extended = false,
				},

				---Pre-hook, called before commenting the line
				---@type fun(ctx: Ctx):string
				pre_hook = nil,

				---Post-hook, called after commenting is done
				---@type fun(ctx: Ctx)
				post_hook = nil,
			})
		end,
	})
	use({ "tpope/vim-fugitive", branch = "master" })
	use("junegunn/vim-easy-align")
	-- use({ "glepnir/dashboard-nvim" })
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-ui-select.nvim",
				config = function()
					require("telescope").setup({
						extensions = {
							["ui-select"] = {
								require("telescope.themes").get_dropdown({}),
							},
						},
					})
					require("telescope").load_extension("ui-select")
				end,
			},
		},
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
