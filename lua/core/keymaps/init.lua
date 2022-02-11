vim.g.which_key_timeout = 100
vim.g.which_key_use_floating_win = 0
vim.g.which_key_max_size = 0
vim.g.mapleader = " "
vim.g.which_key_hspace = 5
vim.g.which_key_vertical = 0
vim.g.which_key_sort_horizontal = 0
vim.g.which_key_flatten = 0

vim.g.which_key_fallback_to_native_key = 1
vim.g.which_key_display_names = {
	["<CR>"] = "↵",
	["<TAB>"] = "⇆",
	["<LEADER>"] = "異",
}

vim.g.which_key_sep = "→"
vim.g.which_key_timeout = 100

local wk = require("whichkey_setup")
local keymap = {}

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

local check_if_local_git_repo = vim.fn.system({
	"git",
	"-C",
	vim.fn.getcwd(),
	"rev-parse",
	"--is-inside-work-tree",
})

local git_keys = {
	name = "+git",
	a = { ":Git add %<CR>", "git add current file" },
	s = { ":Gitsigns blame_line<CR>", "show fancy git blame" },
	t = { ":Gitsigns toggle_current_blame_line<CR>", "toggle inline git blame" },
	p = { ":Git push<CR>", "push commited changes" },
	S = { ":Git status<CR>", "show git status" },
	c = { ":Git commit<CR>", "commit stagedtruees" },
	f = { ":Git fetch<CR>", "fetch changes from remote" },
	C = { ":Telescope git_commits<CR>", "select a specific commit"},
	u = { ":Telescope git_status<CR>", "select git file from git status"},
	F = { ":Telescope git_files<CR>", "select files that are tracked"},
	b = { ":Telescope git_branches", "select a specific branch"}
}

if string.find(check_if_local_git_repo, "true") then -- this is because there are weird characters returned e.g. "true^@" instead of just "true" which is kinda annoying
	keymap.g = git_keys
end

keymap.h = hop_key
keymap.f = explorer_key
keymap.k = kitty_key
keymap.p = pomodoro
keymap.s = sessions
keymap.c = { name = "+NerdCommenter" }
keymap.a = {
	name = "+code",
	a = { ":Lspsaga code_action<CR>", "code action" },
	r = { ":<C-U>Lspsaga range_code_action<CR>", "ranged code action" },
}
keymap.A = require("core.keymaps.bufferline")
keymap["t"] = { ":TSPlaygroundToggle<CR>", "treesitter playground" }

-- FileTypes
vim.cmd("autocmd FileType julia :lua require('core.keymaps.julia')")
vim.cmd("autocmd FileType lua :lua require('core.keymaps.lua')")
vim.cmd("autocmd FileType markdown :lua require('core.keymaps.markdown')")
vim.cmd("autocmd FileType tex :lua require('core.keymaps.texlab')")
vim.cmd("autocmd FileType bib :lua require('core.keymaps.texlab')")

wk.config({
	hide_statusline = true,
	default_keymap_settings = {
		silent = true,
		noremap = true,
	},
})

wk.register_keymap("leader", keymap)
