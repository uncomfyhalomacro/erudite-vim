vim.cmd [[autocmd FileType julia :setlocal expandtab]]
vim.cmd [[autocmd FileType julia :setlocal textwidth=92]]
vim.cmd [[autocmd FileType julia :setlocal colorcolumn+=1]]
vim.g.JuliaFormatter_options = {
    style = "blue",
    indent = 4,
    margin = 92,
    --always_for_in = true,
    --whitespace_typedef = false,
    --whitespace_ops_in_indices = true
}
vim.g.JuliaFormatter_always_launch_server = true
vim.api.nvim_set_keymap("n", "<localleader>jf", "<cmd>JuliaFormatterFormat<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<localleader>jf", "<cmd>JuliaFormatterFormat<CR>", {noremap = true, silent = true})
