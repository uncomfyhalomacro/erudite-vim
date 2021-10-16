local keymap = {}
local kitty_exe = vim.fn.exepath("kitty")
local julia_exe = vim.fn.exepath("julia")
local tmux_exe = vim.fn.exepath("tmux")
if vim.fn.getenv("TERM") == "xterm-kitty" then
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
		local wk = require("whichkey_setup")
		wk.register_keymap("leader", { k = keymap })
	end
elseif vim.fn.getenv("TERM") == "screen" then
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
		local wk = require("whichkey_setup")
		wk.register_keymap("leader", { k = keymap })
	end
end
