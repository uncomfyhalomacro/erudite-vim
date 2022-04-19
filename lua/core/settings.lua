-- Main
vim.g.filetype = "plugin on"
vim.o.foldenable = false
vim.opt.splitright = true
vim.opt.compatible = false
vim.o.autochdir = true
vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.cmd("let &t_ut=''")
vim.opt.shortmess:append("c")
vim.opt.ts = 2
vim.opt.sw = 2
vim.o.cmdheight = 2
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.hidden = true
vim.opt.mouse = "a"
vim.o.showtabline = 1
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.updatetime = 100
vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.timeoutlen = 1000
vim.o.timeout = true
vim.o.guifont = "JuliaMono,Symbols Nerd Font,Noto Color Emoji,monospace:h15"
vim.g.neovide_cursor_vfx_mode = "torpedo"

-- Diagnostics
vim.g.diagnostic_enable_popup_while_jump = 1
vim.g.diagnostic_enable_virtual_text = 0

-- Python
if vim.loop.os_uname().sysname == "Windows_NT" then
  -- set shell in windows
	vim.o.shell = "pwsh-preview.cmd"  -- I use powershell-preview so you might want to edit this
  local python3_path = vim.fn.system({
    "(Get-Command",
    "python3).path"
  })
  local python2_path = vim.fn.system({
    "(Get-Command",
    "python2).path"
  })
	vim.g.python3_host_prog = python3_path
  vim.g.python_host_prog = python2_path
	vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"
	vim.opt.autowrite = true
else
  vim.o.shell = vim.fn.getenv("SHELL")
	vim.g.python3_host_prog = vim.fn.system({
    "which",
    "python3"
  })
	vim.g.python_host_prog = vim.fn.system({
    "which",
    "python2"
  }) -- python2 is dead dream on bro
end
