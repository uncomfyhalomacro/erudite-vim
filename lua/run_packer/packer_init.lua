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
		tag = "v0.2.4",
		as = "catppuccin",
		config = function()
			require("catppuccin").setup({
			    flavour = "mocha"
			})
		end,
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
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})
	use("mfussenegger/nvim-dap")
	use({
		"Shatur/neovim-session-manager",
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
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
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
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp", branch = "main" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip", requires = "hrsh7th/vim-vsnip-integ" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
			{ "uncomfyhalomacro/cmp-latex-symbols", run = "cargo run --release" },
			{ "hrsh7th/cmp-calc" },
			{ "lukas-reineke/cmp-rg" },
			{ "windwp/nvim-autopairs", disable = false },
			{ "lukas-reineke/cmp-under-comparator" },
			{ "hrsh7th/cmp-emoji" },
			{
				"uga-rosa/cmp-dictionary",
				config = function()
					local dict = require("cmp_dictionary")
					dict.setup({
						dic = {
							["*"] = { "/usr/share/dict/words" },
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
	use({
	    "kristijanhusak/vim-dadbod-completion",
	    requires = { "tpope/vim-dadbod" }
	})
	use({
		"andweeb/presence.nvim",
	})
	use("kristijanhusak/orgmode.nvim")
	use({
		"folke/which-key.nvim",
		config = function()
			vim.g.mapleader = " "
			vim.g.maplocalleader = "\\"
		end,
	})
	---UWU fix some of this

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				keywords = {
					TODO = { icon = " ", color = "info", alt = { "DONE", "FIN" } },
				},
				highlight = {
					pattern = { [[.*<(KEYWORDS)\s*:]], [[.*\@(KEYWORDS)\s*]] },
				},
			})
		end,
	})
	use({ "norcalli/nvim-colorizer.lua" })
	use({
		"numToStr/Comment.nvim",
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
	use("folke/lua-dev.nvim")
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
							["frecency"] = {
								show_scores = true,
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
		requires = {
			"tami5/sqlite.lua",
			config = function()
				if vim.fn.getenv("OS") == "Windows_NT" then
					vim.g.sqlite_clib_path = vim.fn.stdpath("config") .. "\\sqlite3.dll"
				end
			end,
			-- disable = vim.fn.getenv("OS") == "Windows_NT"
		},
		disable = vim.fn.getenv("OS") == "Windows_NT",
	})
	use({ "karb94/neoscroll.nvim" })
	use({
		"JuliaEditorSupport/julia-vim",
		config = function()
			vim.g.latex_to_unicode_tab = "off"
		end,
	})

	use({
		"jpalardy/vim-slime",
		branch = "main",
	})

	-- LSP and syntax highlighting
	use("ron-rs/ron.vim")
	-- Because if you are running MS Windows, these plugins won't work :D most of the time
	if vim.fn.getenv("HOME") ~= vim.NIL then
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use({ "nvim-treesitter/playground", after = "nvim-treesitter" })
		use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })
	end

	-- Language Server Protocol Plugins --
	use({
		"neovim/nvim-lspconfig",
		branch = "master",
		requires = {
			{ "nvim-lua/lsp-status.nvim", after = { "nvim-lspconfig", "lualine.nvim" } },
			{ "onsails/lspkind.nvim" },
			{ "kosayoda/nvim-lightbulb" },
		},
	})
	use("ziglang/zig.vim")
	-- EditorConfig
	use({ "gpanders/editorconfig.nvim" })

	if packer_bootstrap then
		require("packer").sync()
	end
end

local config = {
	display = {
		open_fn = require("packer.util").float,
	},
	compile_path = vim.fn.stdpath("config") .. "/lua/run_packer/packer_compiled.lua",
}

return packer.startup({
	plugins,
	config = config,
})
