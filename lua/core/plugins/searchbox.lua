vim.api.nvim_set_keymap(
	"n",
	"<localleader>s",
	'<cmd>lua require("searchbox").incsearch()<CR>',
	{ noremap = true, silent = true }
)
