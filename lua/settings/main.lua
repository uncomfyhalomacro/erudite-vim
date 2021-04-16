-- Main
vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.cmd("filetype plugin on")
vim.cmd('let &t_ut=\'\'')
vim.cmd('set shortmess+=c')
vim.cmd('set sw=4')
vim.cmd('set ts=4')
vim.o.backupdir = os.getenv('HOME').."/.local/share/nvim/backup/,/tmp//" 
vim.o.cmdheight = 2
vim.o.completefunc = "emoji#complete"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.directory = os.getenv('HOME').."/.local/share/nvim/swap/,/tmp//" 
vim.o.hidden = true
vim.o.mouse = 'a'
vim.o.showtabline = 1
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.undodir = os.getenv('HOME').."/.local/share/nvim/undo/, /tmp//" 
vim.o.updatetime = 100
vim.wo.cursorline = true
vim.wo.number = true

-- Set autosave last session
vim.cmd('autocmd BufWritePost * silent! SessionSave')

-- Diagnostics
vim.g.diagnostic_enable_popup_while_jump = 1
vim.g.diagnostic_enable_virtual_text = 0
