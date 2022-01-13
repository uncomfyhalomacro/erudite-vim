local cmp = require("cmp")
local lspkind = require("lspkind")
local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
} -- in case i will use this if lspkind is not installed

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			-- require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
	sources = {
		{ name = "nvim_lsp" },

		-- For vsnip user.
		{ name = "vsnip" },

		-- For luasnip user.
		{ name = "cmp_luasnip" },

		-- For ultisnips user.
		{ name = "ultisnips" },

		{ name = "buffer" },

		{ name = "rg" },
		{ name = "calc" },
		{ name = "latex_symbols" },
		{
			name = "dictionary",
			keyword_length = 2,
			exact = 2,
			async = true,
			capacity = 10,
			debug = false,
			priority = 1,
			group_index = 2,
		},
		{ name = "path" },
	},
	formatting = {
		format = 				lspkind.cmp_format({
					with_text=true,
					menu = ({
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					dictionary = "[Dictionary]",
					nvim_lua = "[Lua]",
					luasnip = "[LuaSnip]",
					rg = "[RipGrep]",
					ultisnips = "[UltiSnips]",
					calc = "[Calc]",
					vsnip = "[Vsnip]",
					latex_symbols = "[LaTeX]",
					})
				})
	},
})
cmp.setup.cmdline("/", {
	sources = cmp.config.sources({
		{ name = "nvim_lsp_document_symbol" },
	}, {
		{ name = "buffer" },
	}),
})
