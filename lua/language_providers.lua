-- Python
if os.getenv("HOME") == nil then
	vim.g.python3_host_prog = "C:/Users/uncomfyhalomacro/scoop/apps/python/current/python"
else
	vim.g.python3_host_prog = "/usr/bin/python3"
	vim.g.python_host_prog = "/usr/bin/python" -- python2 is dead dream on bro
end
