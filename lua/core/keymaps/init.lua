local wk = require("which-key")
-- LEADER PREFIX --
local keymap = {}
-- LOCALLEADER PREFIX --
local local_keymap = {}
-- VISUAL LOCALLEADER PREFIX
local local_visual_keymap = {}

function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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
function GitKeys()
	local wk = require("which-key")
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
		c = { ":Git commit<CR>", "commit staged" },
		f = { ":Git fetch<CR>", "fetch changes from remote" },
		C = { ":Telescope git_commits<CR>", "select a specific commit" },
		u = { ":Telescope git_status<CR>", "select git file from git status" },
		F = { ":Telescope git_files<CR>", "select files that are tracked" },
		b = { ":Telescope git_branches<CR>", "select a specific branch" },
	}

	if string.find(check_if_local_git_repo, "true") then -- this is because there are weird characters returned e.g. "true^@" instead of just "true" which is kinda annoying
		keymap.g = git_keys
		wk.register({ ["<leader>"] = keymap })
		wk.register({ ["<localleader>"] = local_keymap })
	end
end

vim.cmd("autocmd BufEnter * :lua GitKeys()")

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
-- keymap.c = { name = "+NerdCommenter" }
keymap.a = {
	name = "+code",
	a = { ":Lspsaga code_action<CR>", "code action" },
	r = { ":<C-U>Lspsaga range_code_action<CR>", "ranged code action" },
}
keymap.A = require("core.keymaps.bufferline")

map("n", ",", ":BufferLineCyclePrev<CR>", { silent = true })
map("n", ".", ":BufferLineCycleNext<CR>", { silent = true })

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

wk.register({ ["<leader>"] = keymap })
wk.register({ ["<localleader>"] = local_keymap })
wk.register({ ["<localleader>"] = local_visual_keymap })
