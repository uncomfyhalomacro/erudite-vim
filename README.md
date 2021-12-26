<div align="center"><h1> Erudite Vim </h1></div>
<div align="center"><img align="center" src="https://github.com/uncomfyhalomacro/erudite-vim/blob/main/screenshots/logo.png"></img></div><br/>



My neovim configuration. This is my way to learn Lua 🌙. Fully in Lua. I mostly like julia so I am making my own configuration. No more COC stuff and all. Just mostly Lua configuration.

## Prerequisites

- neovim 0.5.0+
- lua
- luajit
- git
- treesitter
- kitty (optional)
- tmux
- yarn
- julia
- rust-analyzer
- cargo
- npm

### Plugins

Just refer [here](https://github.com/uncomfyhalomacro/erudite-vim/blob/main/lua/plugins.lua)

### Benchmarks

**CPU**: Intel i5-10300H (8) @ 4.500GHz

Using [impatient.nvim](https://github.com/lewis6991/impatient.nvim), a project that I am happy that exists, my startup time became so fast 🥳

Below is the profiling report after running `:LuaCacheProfile` from impatient.nvim

```
────────────────────────────────────────┬────────────────┬────────────┬────────────┬────────────┬────────────┐
                                        │ Loader         │ Resolve    │ Load       │ Exec       │ Total      │
────────────────────────────────────────┼────────────────┼────────────┼────────────┼────────────┼────────────┤
Total                                   │                │   0.3288ms │   0.4078ms │   2.0310ms │   2.7676ms │
────────────────────────────────────────┴────────────────┴────────────┴────────────┴────────────┴────────────┘
─────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
By Plugin                                                                                                    │
────────────────────────────────────────┬────────────────┬────────────┬────────────┬────────────┬────────────┤
impatient                               │       standard │   0.0000ms │   0.0000ms │   0.7609ms │   0.7609ms │
lsp-status                              │          cache │   0.0562ms │   0.0428ms │   0.3156ms │   0.4146ms │
nvim-treesitter-playground              │          cache │   0.0541ms │   0.0768ms │   0.2444ms │   0.3752ms │
bufferline                              │          mixed │   0.0528ms │   0.0530ms │   0.1230ms │   0.2288ms │
lspsaga                                 │          mixed │   0.0366ms │   0.0433ms │   0.1326ms │   0.2126ms │
nvim-treesitter                         │          mixed │   0.0284ms │   0.0371ms │   0.1272ms │   0.1927ms │
lualine                                 │          mixed │   0.0279ms │   0.0535ms │   0.1029ms │   0.1843ms │
cmp_buffer                              │          cache │   0.0100ms │   0.0159ms │   0.0413ms │   0.0672ms │
vim                                     │          mixed │   0.0050ms │   0.0176ms │   0.0324ms │   0.0550ms │
cmp_nvim_ultisnips                      │          cache │   0.0108ms │   0.0094ms │   0.0344ms │   0.0546ms │
cmp                                     │          mixed │   0.0123ms │   0.0072ms │   0.0244ms │   0.0439ms │
ayu                                     │          cache │   0.0053ms │   0.0241ms │   0.0132ms │   0.0427ms │
cmp_luasnip                             │          cache │   0.0065ms │   0.0112ms │   0.0197ms │   0.0373ms │
cmp_vsnip                               │          cache │   0.0091ms │   0.0078ms │   0.0160ms │   0.0329ms │
cmp-rg                                  │          cache │   0.0059ms │   0.0067ms │   0.0130ms │   0.0257ms │
language_providers                      │          cache │   0.0078ms │   0.0015ms │   0.0157ms │   0.0250ms │
transparent                             │            nil │   0.0000ms │   0.0000ms │   0.0083ms │   0.0083ms │
nvim-web-devicons                       │             NA │   0.0000ms │   0.0000ms │   0.0017ms │   0.0017ms │
nvim-tree                               │             NA │   0.0000ms │   0.0000ms │   0.0014ms │   0.0014ms │
nvim-blamer                             │             NA │   0.0000ms │   0.0000ms │   0.0007ms │   0.0007ms │
lspconfig                               │            nil │   0.0000ms │   0.0000ms │   0.0006ms │   0.0006ms │
trouble                                 │             NA │   0.0000ms │   0.0000ms │   0.0006ms │   0.0006ms │
lualine_require                         │             NA │   0.0000ms │   0.0000ms │   0.0006ms │   0.0006ms │
cmp_nvim_lsp                            │            nil │   0.0000ms │   0.0000ms │   0.0004ms │   0.0004ms │
────────────────────────────────────────┴────────────────┴────────────┴────────────┴────────────┴────────────┘
─────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
By Module                                                                                                    │
────────────────────────────────────────┬────────────────┬────────────┬────────────┬────────────┬────────────┤
impatient                               │       standard │   0.0000ms │   0.0000ms │   0.7609ms │   0.7609ms │
lspsaga.codeaction                      │          cache │   0.0366ms │   0.0433ms │   0.1309ms │   0.2109ms │
nvim-treesitter-playground.internal     │          cache │   0.0064ms │   0.0382ms │   0.0966ms │   0.1412ms │
lsp-status.messaging                    │          cache │   0.0046ms │   0.0060ms │   0.1158ms │   0.1265ms │
lsp-status                              │          cache │   0.0104ms │   0.0095ms │   0.0967ms │   0.1166ms │
nvim-treesitter.highlight               │          cache │   0.0084ms │   0.0138ms │   0.0462ms │   0.0683ms │
lualine.component                       │          cache │   0.0043ms │   0.0084ms │   0.0448ms │   0.0576ms │
nvim-treesitter                         │          cache │   0.0103ms │   0.0087ms │   0.0364ms │   0.0555ms │
nvim-treesitter-playground.printer      │          cache │   0.0046ms │   0.0063ms │   0.0432ms │   0.0542ms │
vim.treesitter.highlighter              │          cache │   0.0050ms │   0.0176ms │   0.0312ms │   0.0538ms │
nvim-treesitter-playground.promise      │          cache │   0.0187ms │   0.0065ms │   0.0233ms │   0.0485ms │
lualine.utils.utils                     │          cache │   0.0071ms │   0.0223ms │   0.0161ms │   0.0456ms │
nvim-treesitter-playground.query_linter │          cache │   0.0067ms │   0.0116ms │   0.0267ms │   0.0450ms │
ayu.colors                              │          cache │   0.0053ms │   0.0241ms │   0.0132ms │   0.0427ms │
cmp_buffer                              │          cache │   0.0060ms │   0.0080ms │   0.0279ms │   0.0419ms │
nvim-treesitter.locals                  │          cache │   0.0046ms │   0.0089ms │   0.0273ms │   0.0409ms │
lsp-status.util                         │          cache │   0.0118ms │   0.0056ms │   0.0210ms │   0.0384ms │
cmp.utils.highlight                     │          cache │   0.0123ms │   0.0072ms │   0.0185ms │   0.0380ms │
lualine.themes.papercolor_dark          │          cache │   0.0062ms │   0.0144ms │   0.0168ms │   0.0374ms │
cmp_luasnip                             │          cache │   0.0065ms │   0.0112ms │   0.0197ms │   0.0373ms │
cmp_nvim_ultisnips                      │          cache │   0.0062ms │   0.0058ms │   0.0245ms │   0.0364ms │
nvim-treesitter-playground.query        │          cache │   0.0054ms │   0.0023ms │   0.0261ms │   0.0339ms │
cmp_vsnip                               │          cache │   0.0091ms │   0.0078ms │   0.0160ms │   0.0329ms │
nvim-treesitter-playground              │          cache │   0.0075ms │   0.0091ms │   0.0162ms │   0.0327ms │
lsp-status.redraw                       │          cache │   0.0047ms │   0.0026ms │   0.0234ms │   0.0308ms │
bufferline.highlights                   │          cache │   0.0070ms │   0.0068ms │   0.0146ms │   0.0284ms │
bufferline.tabpages                     │          cache │   0.0084ms │   0.0048ms │   0.0151ms │   0.0284ms │
bufferline.models                       │          cache │   0.0038ms │   0.0083ms │   0.0158ms │   0.0278ms │
nvim-treesitter.query_predicates        │          cache │   0.0052ms │   0.0057ms │   0.0158ms │   0.0267ms │
lsp-status.extensions.pyls_ms           │          cache │   0.0061ms │   0.0041ms │   0.0161ms │   0.0264ms │
bufferline.colors                       │          cache │   0.0071ms │   0.0051ms │   0.0141ms │   0.0263ms │
cmp-rg                                  │          cache │   0.0059ms │   0.0067ms │   0.0130ms │   0.0257ms │
cmp_buffer.buffer                       │          cache │   0.0040ms │   0.0079ms │   0.0134ms │   0.0253ms │
bufferline.diagnostics                  │          cache │   0.0038ms │   0.0082ms │   0.0132ms │   0.0252ms │
language_providers                      │          cache │   0.0078ms │   0.0015ms │   0.0157ms │   0.0250ms │
lualine.utils.mode                      │          cache │   0.0052ms │   0.0064ms │   0.0128ms │   0.0244ms │
lsp-status.statusline                   │          cache │   0.0036ms │   0.0064ms │   0.0116ms │   0.0217ms │
bufferline.offset                       │          cache │   0.0055ms │   0.0051ms │   0.0105ms │   0.0211ms │
bufferline.pick                         │          cache │   0.0048ms │   0.0043ms │   0.0113ms │   0.0204ms │
nvim-treesitter-playground.utils        │          cache │   0.0048ms │   0.0027ms │   0.0123ms │   0.0198ms │
lsp-status.extensions.clangd            │          cache │   0.0055ms │   0.0024ms │   0.0117ms │   0.0196ms │
lsp-status.current_function             │          cache │   0.0040ms │   0.0044ms │   0.0108ms │   0.0191ms │
lualine.extensions.nerdtree             │          cache │   0.0051ms │   0.0019ms │   0.0114ms │   0.0183ms │
cmp_nvim_ultisnips.snippets             │          cache │   0.0046ms │   0.0036ms │   0.0099ms │   0.0182ms │
bufferline.duplicates                   │          cache │   0.0041ms │   0.0038ms │   0.0098ms │   0.0177ms │
bufferline.custom_area                  │          cache │   0.0045ms │   0.0032ms │   0.0087ms │   0.0163ms │
bufferline.sorters                      │          cache │   0.0037ms │   0.0034ms │   0.0089ms │   0.0160ms │
lsp-status.diagnostics                  │          cache │   0.0054ms │   0.0018ms │   0.0084ms │   0.0156ms │
transparent                             │            nil │   0.0000ms │   0.0000ms │   0.0083ms │   0.0083ms │
cmp.utils.autocmd                       │             NA │   0.0000ms │   0.0000ms │   0.0042ms │   0.0042ms │
nvim-web-devicons                       │             NA │   0.0000ms │   0.0000ms │   0.0017ms │   0.0017ms │
nvim-tree.view                          │            nil │   0.0000ms │   0.0000ms │   0.0007ms │   0.0007ms │
cmp.utils.api                           │            nil │   0.0000ms │   0.0000ms │   0.0007ms │   0.0007ms │
nvim-blamer                             │             NA │   0.0000ms │   0.0000ms │   0.0007ms │   0.0007ms │
cmp                                     │             NA │   0.0000ms │   0.0000ms │   0.0006ms │   0.0006ms │
lspconfig                               │            nil │   0.0000ms │   0.0000ms │   0.0006ms │   0.0006ms │
nvim-tree                               │             NA │   0.0000ms │   0.0000ms │   0.0006ms │   0.0006ms │
trouble                                 │             NA │   0.0000ms │   0.0000ms │   0.0006ms │   0.0006ms │
lualine                                 │             NA │   0.0000ms │   0.0000ms │   0.0006ms │   0.0006ms │
lspsaga.window                          │            nil │   0.0000ms │   0.0000ms │   0.0006ms │   0.0006ms │
lualine_require                         │             NA │   0.0000ms │   0.0000ms │   0.0006ms │   0.0006ms │
lspsaga.wrap                            │            nil │   0.0000ms │   0.0000ms │   0.0005ms │   0.0005ms │
bufferline                              │            nil │   0.0000ms │   0.0000ms │   0.0005ms │   0.0005ms │
lualine.utils.loader                    │            nil │   0.0000ms │   0.0000ms │   0.0004ms │   0.0004ms │
cmp_nvim_lsp                            │            nil │   0.0000ms │   0.0000ms │   0.0004ms │   0.0004ms │
vim.treesitter.languagetree             │            nil │   0.0000ms │   0.0000ms │   0.0004ms │   0.0004ms │
lspsaga                                 │            nil │   0.0000ms │   0.0000ms │   0.0003ms │   0.0003ms │
bufferline.constants                    │            nil │   0.0000ms │   0.0000ms │   0.0003ms │   0.0003ms │
lspsaga.libs                            │            nil │   0.0000ms │   0.0000ms │   0.0003ms │   0.0003ms │
vim.treesitter.query                    │             NA │   0.0000ms │   0.0000ms │   0.0003ms │   0.0003ms │
nvim-treesitter.query                   │             NA │   0.0000ms │   0.0000ms │   0.0003ms │   0.0003ms │
bufferline.config                       │             NA │   0.0000ms │   0.0000ms │   0.0003ms │   0.0003ms │
vim.lsp.protocol                        │            nil │   0.0000ms │   0.0000ms │   0.0003ms │   0.0003ms │
cmp.utils.misc                          │            nil │   0.0000ms │   0.0000ms │   0.0003ms │   0.0003ms │
nvim-treesitter.info                    │            nil │   0.0000ms │   0.0000ms │   0.0002ms │   0.0002ms │
vim.lsp.util                            │             NA │   0.0000ms │   0.0000ms │   0.0002ms │   0.0002ms │
nvim-treesitter.ts_utils                │             NA │   0.0000ms │   0.0000ms │   0.0002ms │   0.0002ms │
nvim-treesitter.install                 │            nil │   0.0000ms │   0.0000ms │   0.0002ms │   0.0002ms │
nvim-treesitter.configs                 │             NA │   0.0000ms │   0.0000ms │   0.0002ms │   0.0002ms │
cmp.config                              │            nil │   0.0000ms │   0.0000ms │   0.0002ms │   0.0002ms │
nvim-treesitter.parsers                 │             NA │   0.0000ms │   0.0000ms │   0.0001ms │   0.0001ms │
nvim-treesitter.utils                   │             NA │   0.0000ms │   0.0000ms │   0.0001ms │   0.0001ms │
────────────────────────────────────────┴────────────────┴────────────┴────────────┴────────────┴────────────┘
```

This is how fast [impatient](https://github.com/lewis6991/impatient.nvim) is. More benchmarks can be found [here](https://github.com/uncomfyhalomacro/erudite-vim/tree/main/benchmarks)

# TODO

- [ ] Separate lsp configs?
- [ ] Replace packer with [dep](https://github.com/chiyadev/dep)?
- [ ] Write the keymaps in a doc file or something
