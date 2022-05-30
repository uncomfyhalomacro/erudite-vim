require("nvim-tree").setup({
	ignore_ft_on_setup = { "alpha" },
	update_cwd = true,
	respect_buf_cwd = true,
	--respect_buf_cwd = 1,
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
	},
	actions = {
		change_dir = {
			global = true,
		},
		open_file = {
			quit_on_open = false,
		},
	},
	view = {
		hide_root_folder = false,
		width = 45,
		height = 30,
		side = "left",
		signcolumn = "yes",
	},
})
