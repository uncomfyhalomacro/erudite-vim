-- Check TERM
if vim.fn.getenv("TERM") == "xterm-kitty" and vim.fn.getenv("TERM_PROGRAM") == vim.NIL then
	vim.g.slime_target = "kitty"
	vim.g.slime_default_config = { window_id = 1, listen_on = os.getenv("KITTY_LISTEN_ON") }
elseif vim.fn.getenv("TERM_PROGRAM") == "tmux" then
	vim.g.slime_target = "tmux"
	vim.g.slime_paste_file = "$HOME/.slime_paste"
	vim.cmd([[let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}]])
else
	vim.g.slime_target = "neovim"
	-- vim.g.slime_target = "screen" -- as described in vim-slime's readme, screen is the default
end
