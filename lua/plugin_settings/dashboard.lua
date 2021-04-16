vim.g.dashboard_default_executive = "fzf"
vim.g.dashboard_custom_section = {
last_session = {
    description = {" Load Last Session        SPC l l"},
    command = 'SessionLoad'
},
newfile = {
    description = {" New File                 SPC n  "},
    command = 'DashboardNewFile'
},
findfile = {
    description = {" Find File                SPC F  "},
    command = 'DashboardFindFile'
},
history = {
    description = {" History                  SPC h  "},
    command = 'DashboardFindHistory'

},
coc_explorer = {
    description = {" Open File Explorer       SPC f  "},
    command = 'CocCommand explorer --preset floating'
}
}
