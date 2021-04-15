-- Main
vim.cmd("filetype plugin on")
vim.o.hidden = true
vim.o.splitbelow = true
vim.cmd('set ts=4')
vim.o.mouse = 'a'
vim.cmd('set sw=4')
vim.wo.number = true
vim.wo.cursorline = true
vim.o.cmdheight = 2
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.o.showtabline = 1
vim.o.updatetime = 100
vim.o.backupdir = os.getenv('HOME').."/.local/share/nvim/backup/,/tmp//" 
vim.o.directory = os.getenv('HOME').."/.local/share/nvim/swap/,/tmp//" 
vim.o.undodir = os.getenv('HOME').."/.local/share/nvim/undo/, /tmp//" 
vim.o.completefunc = "emoji#complete"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.cmd('set shortmess+=c')
vim.o.termguicolors = true
vim.cmd('let &t_ut=\'\'')

-- Set autosave last session
vim.cmd('autocmd BufWritePost * silent! SessionSave')

-- Diagnostics
vim.g.diagnostic_enable_popup_while_jump = 1
vim.g.diagnostic_enable_virtual_text = 0

-- Keymappings will be here for now
-- Explorer
vim.api.nvim_set_keymap('n', '<Space>f', ':CocCommand explorer --preset floating<CR>', {noremap= false, silent = false})
vim.api.nvim_set_keymap('n', '<Space>e', ':CocCommand explorer<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>e', ':CocCommand explorer<CR>', {noremap = true, silent = true})
vim.cmd('autocmd BufEnter * if (winnr(\'$\') == 1 && &filetype == \'coc-explorer\') | q | endif')
vim.g.coc_explorer_global_presets = {
    floating = {
	position = 'floating'
    },
    floatingLeftside = {
	position = 'floating',
	['floating-position'] = 'left-center',
	['floating-width'] = 30
    },
    floatingRightside = {
	position = 'floating',
	['floating-position'] = 'right-center',
	['floating-width'] = 30
    },
    simplify = {
	['file.child.template'] = '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
    }
}

-- Dashboard
vim.api.nvim_set_keymap('n', '<Space>h', ':DashboardFindHistory<CR>', {noremap= false, silent = false})
vim.api.nvim_set_keymap('n', '<Space>F', ':DashboardFindFile<CR>', {noremap= false, silent = false})
vim.api.nvim_set_keymap('n', '<Space>l', ':SessionLoad<CR>', {noremap= false, silent = false})
vim.api.nvim_set_keymap('n', '<Space>n', ':DashboardNewFile<CR>', {noremap= false, silent = false})

-- Formatting
vim.api.nvim_set_keymap('n', '<Space>k', ':lua vim.lsp.buf.formatting()', {noremap = false, silent = false})
