local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end
local lspkind_ok, lsp_kind = pcall(require, "lspkind")
if not lspkind_ok then
    return
end
npairs.setup({
    check_ts = true,
    ts_config = {
        lua = { "string", "source" },
        julia = { "string", "argument_list" },
    },
})
local cmp_autopairs_status_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status_ok then
    return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            vim.fn["vsnip#anonymous"](args.body)

            -- For `luasnip` user.
            -- require("luasnip").lsp_expand(args.body)

            -- For `ultisnips` user.
            --vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },
    sorting = {
        priority_weight = 1,
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    sources = {
        { name = "nvim_lsp", group_index = 1, priority = 2 },

        -- For vsnip user.
        { name = "vsnip", group_index = 1, priority = 1 },

        -- For luasnip user.
        --{ name = "cmp_luasnip", group_index = 1 },

        -- For ultisnips user.
        --{ name = "ultisnips", group_index = 1 },

        { name = "buffer", group_index = 2 },

        -- emojis
        { name = "emoji", group_index = 2 },

        { name = "rg", group_index = 2, priority = 3 },
        { name = "calc" },
        { name = "latex_symbols", group_index = 2, priority = 98 },
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
        format = lsp_kind.cmp_format({
            with_text = true,
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                dictionary = "[Dictionary]",
                calc = "[Calc]",
                vsnip = "[Vsnip]",
                latex_symbols = "[LaTeX]",
                emoji = "[Emoji]",
                rg = "[RipGrep]",
            },
        }),
    },
})
cmp.setup.cmdline("/", {
    sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
    }, {
        { name = "buffer" },
    }),
})

vim.api.nvim_command(
    [[autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })]]
)
