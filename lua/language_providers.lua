-- Python
if os.getenv("HOME") == nil then
    vim.g.python3_host_prog = "/c/Users/uncomfyhalomacro/scoop/apps/python/current/python"
else
    vim.g.python3_host_prog = "/usr/bin/python"
    vim.g.python_host_prog = "/usr/bin/python2" -- python2 is dead dream on bro
end
