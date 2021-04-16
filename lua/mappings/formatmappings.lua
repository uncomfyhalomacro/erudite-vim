vim.api.nvim_set_keymap('n', '<Space>k', ':lua vim.lsp.buf.formatting()', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<Space>gr', ':Lspsaga rename<CR>', {noremap = true, silent = false})
