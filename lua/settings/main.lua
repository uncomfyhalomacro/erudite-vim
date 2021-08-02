-- Main
vim.g.filetype = 'plugin on'
vim.opt.splitright = true
vim.opt.compatible = false
vim.o.autochdir = true
vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.cmd('let &t_ut=\'\'')
vim.opt.shortmess:append('c')
vim.opt.ts = 4
vim.opt.sw = 4
vim.o.backupdir = os.getenv('HOME').."/.local/share/nvim/backup/,/tmp//"
vim.o.cmdheight = 2
vim.o.completefunc = "emoji#complete"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.directory = os.getenv('HOME').."/.local/share/nvim/swap/,/tmp//"
vim.o.hidden = true
vim.opt.mouse = 'a'
vim.o.showtabline = 1
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.undodir = os.getenv('HOME').."/.local/share/nvim/undo/, /tmp//"
vim.o.updatetime = 100
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.timeoutlen = 1000
vim.o.timeout = true
-- Diagnostics
vim.g.diagnostic_enable_popup_while_jump = 1
vim.g.diagnostic_enable_virtual_text = 0

-- Latex for Julia
vim.g.latex_to_unicode_auto = 1
vim.g.latex_to_unicode_suggestions = 0
vim.g.latex_to_unicode_eager = 1
