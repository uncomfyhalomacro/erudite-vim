-- Vim Slime
vim.g.slime_target = "kitty"
vim.g.slime_default_config = {window_id= 1, listen_on= os.getenv('KITTY_LISTEN_ON')}

-- Completions Neovim
vim.g.completion_enable_auto_hover = 1
vim.g.completion_enable_auto_popup = 1

-- Diagnostics
vim.g.diagnostic_enable_popup_while_jump = 1
vim.g.diagnostic_enable_virtual_text = 0
