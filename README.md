<div align="center"><h1> Erudite Vim </h1></div>

![Image](https://github.com/uncomfyhalomacro/erudite-vim/blob/main/screenshots/screenshot_new.png)

![Image](https://github.com/uncomfyhalomacro/erudite-vim/blob/main/screenshots/screenshot_whichkey.png)

![Image](https://github.com/uncomfyhalomacro/erudite-vim/blob/main/screenshots/full_setup.png)

This configuration is more focused for Julia users. But it can still be modified to be used for other languages. I am
planning to add that functionality soon but it is not a priority as of yet. Feel free to fork! :smiley:

## Prerequisites

- neovim 0.7.0+ (recommended)
- git
- treesitter 
- kitty or tmux (either one of the two or both)
- yarn and npm
- julia (for julians)
- rust-analyzer (for rustaceans)
- cargo (for rustaceans)
- Install Julia Mono font (optional)

## For Julia users

Run the following inside your shell:

```shell
julia --project=@nvim-lspconfig -e 'import Pkg; Pkg.add(["LanguageServer", "PackageCompiler"]); using PackageCompiler; create_sysimage(:LanguageServer, sysimage_path=dirname(Pkg.Types.Context().env.project_file) * "/languageserver.so")'
```

# Installation

There is already a bootstrap script for this configuration, specifically in
`packer_init.lua`. It is not perfect so I suggest read the config and
copy/remove some stuff that you do not need and make your own bootstrap script
that works for you. Otherwise, good for you I guess?

## Plugins

Just refer [here](https://github.com/uncomfyhalomacro/erudite-vim/blob/3b83f6d9d82c6f159bc180832584ec25c54a9d04/lua/run_packer/packer_init.lua#L25-L446)

# TODO

- [ ] Separate lsp configs? (Not sure about this approach)
- [ ] ~~Replace packer with [dep](https://github.com/chiyadev/dep)?~~ Fixed with
  https://github.com/wbthomason/packer.nvim/issues/750#issuecomment-1006070458
- [ ] Write the keymaps in a doc file or something (In progress)
- [ ] Add haskell and ghci (Adding a new slime command)
- [ ] Add python repl support (Adding a new slime command)
- [x] make markdown preview dynamic with flatpak installed browser or installed
  from a distro's package manager? (Hmmm. Use xdg-open instead to respect user defaults. For macOS and windows users,
  you have to edit that file i guess :woozy_face:)
- [x] Replace dashboard-nvim with alpha-nvim (seems glepnir is MIA, i hope
  glepnir is fine)
- [x] ~~Configure vim-slime to add neovim panes for MS Windows~~ (Windows is kinda annoying to use with vim-slime with
  neovim panes. It works but I rather use WSL)
- [x] Replaced nvim-whichkey lua with folke's which-key.nvim
- [ ] Reconfigure completions based on filetype e.g. Julia should have only cmp-latex cmp-vsnip, and cmp-emoji
- [x] Add neovim terminal support for repls. e.g. useful for gui or neovide users
- [ ] make saner keymappings but idk if mine is already sane lol
- [ ] add nvim-dap configurations. not a priority for now. if someone is able to help, pls do open a pr. i dont need it at this moment lolz
