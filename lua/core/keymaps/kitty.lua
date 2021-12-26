if vim.fn.getenv("TERM") == "xterm-kitty" and vim.fn.getenv("TERM_PROGRAM") == vim.NIL then
	local kitty = {
		name = "+terminal",
		k = { ":!kitty @new-window --window-type os --cwd $PWD<CR>:<C-[><CR>", "open terminal here" },
		s = { ":!kitty @new-window --cwd $PWD<CR>:<C-[><CR>", "split-terminal" },
		-- going to add ghpc or whatever haskell
	}

	return kitty
elseif vim.fn.getenv("TERM_PROGRAM") == "tmux" then
	local tmux = {
		name = "+tmux",
		k = { ":!tmux split-window<CR>:<C-[><CR>", "split current tmux-window" },
		s = { ":!tmux split-window" .. ' -c "' .. vim.fn.getcwd() .. '"<CR>:<C-[><CR>', "split tmux-window on cwd" },
	}
	return tmux
else
	local someterm = {
		name = "+need kitty or tmux",
	}
	return someterm
end
