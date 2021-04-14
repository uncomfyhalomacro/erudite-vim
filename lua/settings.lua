-- Main
vim.cmd("filetype plugin on")
vim.o.hidden = true
vim.o.splitbelow = true
vim.o.tabstop = 4
vim.o.mouse = 'cav'
vim.o.shiftwidth = 4
vim.wo.number = true
vim.wo.cursorline = true
vim.o.cmdheight = 3
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
vim.o.termguicolors = false

-- Diagnostics
vim.g.diagnostic_enable_popup_while_jump = 1
vim.g.diagnostic_enable_virtual_text = 0
