local nvim_lsp = require("lspconfig")
local wk = require("which-key")
local opts = { noremap = true, silent = true }
local capabilities = vim.lsp.protocol.make_client_capabilities()

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	-- Mappings.
	local keymap = {
		l = {
			name = "+lsp",
			-- workspace
			a = { "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "add workspace" },
			r = { "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "remove workspace" },
			--  workspace symbols
			w = { "<Cmd>Telescope lsp_workspace_symbols<CR>", "show workspace symbols" },
			-- dynamic workspace symbols
			W = { "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "show all workspace symbols" },
			-- code action
			q = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
		},
		r = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "rename func/var/def" },
	}
	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		keymap.l.f = { "<Cmd>lua vim.lsp.buf.formatting()<CR>", "format" }
	elseif client.resolved_capabilities.document_range_formatting then
		keymap.l.f = { "<Cmd>lua vim.lsp.buf.range_formatting()<CR>", "format" }
	end
	wk.register({ ["<leader>"] = keymap }, { buffer = bufnr })

	-- saga mappings
	-- show hover doc: do it twice so you can go into the hover window and scroll. press q to exit
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR><Cmd>:lua vim.lsp.buf.hover()<CR>", opts)
	-- show signature help
	buf_set_keymap("n", "gs", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- show definition
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- jump diagnostic
	buf_set_keymap("n", "[g", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "]g", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)

	---- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
			augroup lsp_auto
				autocmd! * <buffer>
				 autocmd CursorHold <buffer> :lua vim.lsp.buf.document_highlight()
				 autocmd CursorMoved <buffer> :lua vim.lsp.buf.clear_references()
			augroup END
		]],
			true
		)
	end
end

-- enable snippets
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {
	pyright = {},
	rust_analyzer = {},
	bashls = {},
	clangd = {},
	jsonls = {},
	hls = {},
	zls = {
		cmd = { "zls" },
		filetypes = { "zig", "zir" },
	},
	julials = {
		cmd = {
			"julia",
			"-J" .. vim.fn.getenv("HOME") .. "/.julia/environments/nvim-lspconfig/languageserver.so",
			"--sysimage-native-code=yes",
			"--startup-file=no",
			"--history-file=no",
			"-e",
			[[
		# just in case
		function recurse_project_paths(path::AbstractString)
			isnothing(Base.current_project(path)) && return
			tmp = path
			CUSTOM_LOAD_PATH = []
			while !isnothing(Base.current_project(tmp))
					pushfirst!(CUSTOM_LOAD_PATH, tmp)
					tmp = dirname(tmp)
			end
			# push all to LOAD_PATHs
			pushfirst!(Base.LOAD_PATH, CUSTOM_LOAD_PATH...)
			return joinpath(CUSTOM_LOAD_PATH[1], "Project.toml")
    end
		buffer_file_path = "]] .. vim.fn.expand("%:p:h") .. '";' .. [[
    project_path = let 
			dirname(something(
				# 1. Check if there is an explicitly set project
				# 2. Check for Project.toml in current working directory
				# 3. Check for Project.toml from buffer's full file path exluding the file name
				# 4. Fallback to global environment
				Base.load_path_expand((
                p = get(ENV, "JULIA_PROJECT", nothing);
                p === nothing ? nothing : isempty(p) ? nothing : p
        )),
				Base.current_project(strip(buffer_file_path)),
				Base.current_project(pwd()),
				Base.active_project()
			))
		end
    # Some projects require Pkg to activate and instantiate it
    # Activate the project 
    import Pkg;
    Pkg.activate(project_path);
    # Instantiate project
    Pkg.instantiate();
		@info "Active project: $(Base.active_project())"
    ls_install_path = joinpath(get(DEPOT_PATH, 1, joinpath(homedir(), ".julia")), "environments", "nvim-lspconfig");
    pushfirst!(LOAD_PATH, ls_install_path);
    using LanguageServer;
    popfirst!(LOAD_PATH);
		@info "LOAD_PATHS: $(Base.load_path())"
    depot_path = get(ENV, "JULIA_DEPOT_PATH", "");
    symbol_server_path = joinpath(homedir(), ".cache", "nvim", "julia_lsp_symbol_store")
    mkpath(symbol_server_path)
		@info "LanguageServer has started with buffer $project_path or $(pwd())"
    server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path, nothing, symbol_server_path);
    server.runlinter = true;
    run(server);
		]],
		},
		settings = {
			julia = {
				symbolCacheDownload = true,
				lint = {
					missingrefs = "all",
					iter = true,
					lazy = true,
					modname = true,
				},
			},
		},
	},
	sumneko_lua = {
		cmd = {
			"lua-language-server",
		},
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	texlab = {
		cmd = { "texlab" },
		filetypes = { "tex", "bib" },
		settings = {
			bibtex = {
				formatting = {
					lineLength = 120,
				},
			},
			latex = {
				build = {
					args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
					executable = "latexmk",
					onSave = true,
				},
				forwardSearch = {
					executable = "/usr/bin/zathura",
					args = { "%p" },
					onSave = true,
				},
				lint = {
					onChange = true,
				},
			},
		},
	},
	-- linters + formatters
	efm = {
		cmd = { "efm-langserver" },
		init_options = { documentFormatting = true },
		filetypes = {
			"lua",
			"python",
			"markdown",
			"sh",
			"json",
		},
		settings = {
			rootMarkers = { ".git/" },
			languages = {
				lua = {
					{
						formatCommand = "stylua --color Never",
						formatStdin = true,
						rootMarkers = { "stylua.toml", ".stylua.toml" },
					},
				},
				markdown = {
					{
						lintCommand = "markdownlint -s",
						lintStdin = true,
						lintFormats = { "%f: %l: %m" },
					},
				},
			},
		},
	},
}

for lsp, setup in pairs(servers) do
	local lsp_status = require("lsp-status")
	lsp_status.register_progress()
	lsp_status.messages()
	setup.capabilities = vim.tbl_extend("keep", setup.capabilities or {}, lsp_status.capabilities)
	setup.on_attach = lsp_status.on_attach
	setup.on_attach = on_attach
	lsp_status.register_client(setup.on_attach)
	setup.capabilities = lsp_status.capabilities
	setup.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
	if lsp == "julials" then
		capabilities.textDocument.completion.completionItem.preselectSupport = true
		capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
		capabilities.textDocument.completion.completionItem.deprecatedSupport = true
		capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
		capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
		capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
		capabilities.textDocument.completion.completionItem.resolveSupport = {
			properties = { "documentation", "detail", "additionalTextEdits" },
		}
		capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown" }
		capabilities.textDocument.codeAction = {
			dynamicRegistration = true,
			codeActionLiteralSupport = {
				codeActionKind = {
					valueSet = (function()
						local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
						table.sort(res)
						return res
					end)(),
				},
			},
		}

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = false,
			underline = false,
			signs = true,
			update_in_insert = false,
		})
	end
	nvim_lsp[lsp].setup(setup)
end

-- TODO move elsewhere?
vim.cmd("highlight! link LspDiagnosticsDefaultError WarningMsg")
vim.fn.sign_define("LspDiagnosticsSignError", {
	texthl = "LspDiagnosticsSignError",
	text = "",
	numhl = "LspDiagnosticsSignError",
})
vim.fn.sign_define("LspDiagnosticsSignWarning", {
	texthl = "LspDiagnosticsSignWarning",
	text = "",
	numhl = "LspDiagnosticsSignWarning",
})
vim.fn.sign_define("LspDiagnosticsSignInformation", {
	texthl = "LspDiagnosticsSignInformation",
	text = "",
	numhl = "LspDiagnosticsSignInformation",
})
vim.fn.sign_define("LspDiagnosticsSignHint", {
	texthl = "LspDiagnosticsSignHint",
	text = "",
	numhl = "LspDiagnosticsSignHint",
})
