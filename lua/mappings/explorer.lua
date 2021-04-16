--vim.api.nvim_set_keymap('n', '<Space>f', ':CocCommand explorer --preset floating<CR>', {noremap= false, silent = false})
--vim.api.nvim_set_keymap('n', '<Space>e', ':CocCommand explorer<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>e', ':CocCommand explorer<CR>', {noremap = true, silent = true})
vim.cmd('autocmd BufEnter * if (winnr(\'$\') == 1 && &filetype == \'coc-explorer\') | q | endif')
