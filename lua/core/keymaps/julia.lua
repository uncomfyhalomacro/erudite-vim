local keymap = {}
local kitty_exe = vim.fn.exepath("kitty")
local julia_exe = vim.fn.exepath("julia")
local tmux_exe = vim.fn.exepath("tmux")
local wk = require("which-key")
if (vim.fn.getenv("TERM") == "xterm-kitty") and vim.fn.getenv("TERM_PROGRAM") == vim.NIL then
	if kitty_exe ~= "" and julia_exe ~= "" then
		local project_path = vim.fn.system({
			julia_exe,
			"--startup-file=no",
			"-q",
			"-e",
			"print(dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2]))))",
		})
		local julia = {
			name = "+julia",
			o = {
				":!"
					.. kitty_exe
					.. " @new-window --window-type os --cwd="
					.. vim.fn.getcwd()
					.. " "
					.. julia_exe
					.. " --project="
					.. project_path
					.. "<CR>:<C-[><CR>",
				"open julia repl in kitty",
			},
			r = {
				":!"
					.. kitty_exe
					.. " @new-window"
					.. " "
					.. julia_exe
					.. " --project="
					.. project_path
					.. "<CR>:<C-[><CR> :%SlimeSend<CR>",
				"run code from current buffer",
			},
		}
		keymap.j = julia
		wk.register({ ["<leader>k"] = keymap })
	end
elseif vim.fn.getenv("TERM_PROGRAM") == "tmux" then
	if tmux_exe ~= "" then
		local project_path = vim.fn.system({
			julia_exe,
			"--startup-file=no",
			"-q",
			"-e",
			"print(dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2]))))",
		})
		local julia = {
			name = "+julia",
			o = {
				":!"
					.. tmux_exe
					.. " split-window "
					.. "-c "
					.. vim.fn.getcwd()
					.. " "
					.. julia_exe
					.. " --project="
					.. project_path
					.. "<CR>:<C-[><CR>",
				"open julia repl in tmux",
			},
			r = {
				":!"
					.. tmux_exe
					.. " split-window "
					.. "-c "
					.. vim.fn.getcwd()
					.. " "
					.. julia_exe
					.. " --project="
					.. project_path
					.. "<CR>:<C-[><CR> :%SlimeSend<CR>",
				"run code from current buffer",
			},
		}
		keymap.j = julia
		wk.register({ ["<leader>k"] = keymap })
	end
else -- we assume the user is using native terminal splits from neovim itself
	local project_path = vim.fn.system({
		julia_exe,
		"--startup-file=no",
		"-q",
		"-e",
		"print(dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2]))))",
	})
	local termcmd = ":sp term://julia --project="
	local julia = {
		name = "+julia",
		o = {
			termcmd .. project_path .. "<CR>:<C-[><CR>",
			"open julia repl in nvim terminal",
		},
		-- r = {
		-- 	termcmd .. project_path .. "<CR>:<C-[><CR>:b#<CR> :%SlimeSend<CR>",
		-- 	"run code from previous buffer",
		-- },
	}
	keymap.j = julia
	wk.register({ ["<leader>k"] = keymap })
end
