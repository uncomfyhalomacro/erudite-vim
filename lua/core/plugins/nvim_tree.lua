vim.g.nvim_tree_respect_buf_cwd = 1
require("nvim-tree").setup({
	open_on_startup = false,
	update_cwd = true,
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
	},
})
