local wk = require("which-key")
-- LEADER PREFIX --
local keymap = {}
-- LOCALLEADER PREFIX --
local local_keymap = {}
-- VISUAL LOCALLEADER PREFIX
local local_visual_keymap = {}

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function unmap(mode, rhs)
	vim.api.nvim_del_keymap(mode, rhs)
end

map("n", "t", ":TodoTelescope<CR>", { silent = true, noremap = true })

-- LEADER PREFIX --
-- Basic stuff
keymap.q = { ":q<CR>", "exit buffer" }
keymap.w = { ":w<CR>", "write buffer to file" }

local explorer_key = require("core.keymaps.explorer")
local kitty_key = require("core.keymaps.kitty")

keymap.x = { "<cmd>TroubleToggle<CR>", "list diagnostics" }

local sessions = {
	name = "+sessions",
	s = { ":SessionManager save_current_session<CR>", "save current session" },
	l = { ":SessionManager load_last_session<CR>", "load last session" },
	a = { ":SessionManager load_session<CR>", "load recent sessions" },
}

local pomodoro = {
	name = "+pomodoro",
	s = { ":PomodoroStart<CR>", "start pomodoro timer" },
	t = { ":PomodoroStatus<CR>", "display pomodoro status" },
	S = { ":PomodoroStop<CR>", "stop pomodoro timer" },
}

local hop_key = {
	name = "+hop",
	h = { ":HopWord<CR>", "hop words" },
	p = { ":HopPattern<CR>", "hop pattern" },
	l = { ":HopLine<CR>", "hop to any visible lines" },
}

local hop_key_extend = {
	name = "+more",
	h = { ":HopWordCurrentLine<CR>", "hop words on currentline" },
	p = { ":HopPatternCurrentLine<CR>", "hop pattern on currentline" },
	l = { ":HopLineStart<CR>", "hop to any visible non-whitespace character" },
}

hop_key.e = hop_key_extend

function git_automap()
	local check_if_local_git_repo = vim.fn.system({
		"git",
		"-C",
		vim.fn.expand("%:p:h"),
		"rev-parse",
		"--is-inside-work-tree",
	})

	-- this is because there are weird characters returned e.g. "true^@" instead of just "true" which is kinda annoying
	if check_if_local_git_repo == "true\n" then
		local git_keys = {
			name = "+git",
			a = { ":Git add %<CR>", "git add current file" },
			s = { ":Gitsigns blame_line<CR>", "show fancy git blame" },
			t = { ":Gitsigns toggle_current_blame_line<CR>", "toggle inline git blame" },
			p = { ":Git push<CR>", "push commited changes" },
			S = { ":Git status<CR>", "show git status" },
			c = { ":Git commit<CR>", "commit staged" },
			f = { ":Git fetch<CR>", "fetch changes from remote" },
			C = { ":Telescope git_commits<CR>", "select a specific commit" },
			u = { ":Telescope git_status<CR>", "select git file from git status" },
			F = { ":Telescope git_files<CR>", "select files that are tracked" },
			b = { ":Telescope git_branches<CR>", "select a specific branch" },
		}
		require("which-key").register({ ["<leader>g"] = git_keys })
	else
		local git_keys = "which_key_ignore"
		require("which-key").register({ ["<leader>g"] = git_keys })
	end
end
vim.api.nvim_exec(
	[[
	augroup git_automapper
		autocmd! * <buffer>
		autocmd WinEnter,BufEnter,BufLeave * :lua git_automap()
	augroup END
	]],
	true
)

local zk_keys = {
	name = "+zettelkasten",
	n = { ":ZkNew<CR>", "new note" },
	t = { ":ZkTags<CR>", "tags" },
	l = { ":ZkLinks<CR>", "links" },
	b = { ":ZkNotes<CR>", "list notes" },
}

keymap.z = zk_keys
keymap.h = hop_key
keymap.f = explorer_key
keymap.k = kitty_key
keymap.p = pomodoro
keymap.s = sessions
keymap.A = require("core.keymaps.bufferline")

map("n", ",", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", ".", ":BufferLineCycleNext<CR>", { silent = true })
map("n", "c", ":BufferLinePickClose<CR>", { silent = true })

local treesitter_key = {
	name = "+treesitter",
	p = { ":TSPlaygroundToggle<CR>", "treesitter playground" },
	t = { ":TSBufToggle<CR>", "toggle treesitter on current buffer" },
	T = { ":TSToggleAll<CR>", "toggle treesitter on all buffers" },
	h = { ":TSHighlightCapturesUnderCursor<CR>", "show highlight groups under cursor" },
}
keymap.t = treesitter_key
local searchbox_key = {
	name = "+search",
	s = { ":SearchBoxSimple<CR>", "simple search" },
	n = { ":SearchBoxIncSearch<CR>", "find nearest match" },
}
local_keymap.s = searchbox_key
local comment_key_blockwise = {
	name = "+comment blockwise",
	c = {
		name = "comment blocks",
	},
}

local_keymap.b = comment_key_blockwise

local comment_key_linewise = {
	name = "+comment linewise",
	A = "insert comment EOL",
	c = "comment selected line",
	o = "insert comment below",
	O = "insert comment above",
}

local_keymap.c = comment_key_linewise

local_visual_keymap.b = "comment selected blockwise"
local_visual_keymap.c = "comment selected linewise"

-- FileTypes
vim.cmd("autocmd FileType julia :lua require('core.keymaps.julia')")
vim.cmd("autocmd FileType lua :lua require('core.keymaps.lua')")
vim.cmd("autocmd FileType markdown :lua require('core.keymaps.markdown')")
vim.cmd("autocmd FileType tex :lua require('core.keymaps.texlab')")
vim.cmd("autocmd FileType bib :lua require('core.keymaps.texlab')")

wk.setup({
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

wk.register({ ["<leader>"] = keymap })
wk.register({ ["<localleader>"] = local_keymap })
wk.register({ ["<localleader>"] = local_visual_keymap })
