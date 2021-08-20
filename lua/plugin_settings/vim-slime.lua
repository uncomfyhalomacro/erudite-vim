-- Check TERM
if os.getenv("TERM") == "xterm-kitty" then
	vim.g.slime_target = "kitty"
	vim.g.slime_default_config = { window_id = 1, listen_on = os.getenv("KITTY_LISTEN_ON") }
else
	vim.g.slime_target = "tmux"
	vim.g.slime_paste_file = "$HOME/.slime_paste"
	vim.cmd([[let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}]])
end
