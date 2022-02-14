<div align="center"><h1> Erudite Vim </h1></div>

![Image](https://github.com/uncomfyhalomacro/erudite-vim/blob/main/screenshots/screenshot_new.png)

![Image](https://github.com/uncomfyhalomacro/erudite-vim/blob/main/screenshots/screenshot_whichkey.png)

![Image](https://github.com/uncomfyhalomacro/erudite-vim/blob/main/screenshots/full_setup.png)






This configuration is more focused for Julia users. But it can still be modified
to be used for other languages. I am planning to add that functionality soon but
it is not a priority as of yet. Feel free to fork! :smiley:

## Prerequisites

- neovim 0.5.0+ (recommended)
- git
- treesitter 
- kitty or tmux (either one of the two or both)
- yarn and npm
- julia (for julians)
- rust-analyzer (for rustaceans)
- cargo (for rustaceans)
- Install Julia Mono font (optional)

# Installation

There is already a bootstrap script for this configuration, specifically in
`packer_init.lua`. It is not perfect so I suggest read the config and
copy/remove some stuff that you do not need and make your own bootstrap script
that works for you. Otherwise, good for you I guess?

### Plugins

Just refer [here](https://github.com/uncomfyhalomacro/erudite-vim/blob/main/lua/packer_init.lua)

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
- [ ] ~~Configure vim-slime to add neovim panes for MS Windows~~ (Windows is kinda annoying to use with vim-slime with
  neovim panes. It works but I rather use WSL)
- [x] Replaced nvim-whichkey lua with folke's which-key.nvim
