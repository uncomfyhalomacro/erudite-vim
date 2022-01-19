<div align="center"><h1> Erudite Vim </h1></div>
<div align="center"><img align="center" src="https://github.com/uncomfyhalomacro/erudite-vim/blob/main/screenshots/screenshot.png"></img></div><br/>



My neovim configuration. Fully written in Lua. This configuration is more focused for Julia users. But it can still be modified to be used for other languages. I am planning to add that functionality soon but it is not a priority as of yet. Feel free to fork! :smiley:

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
- Install Julia Mono font

### Plugins

Just refer [here](https://github.com/uncomfyhalomacro/erudite-vim/blob/main/lua/plugins.lua)

# TODO

- [ ] Separate lsp configs? (Not sure about this approach)
- [ ] ~~Replace packer with [dep](https://github.com/chiyadev/dep)?~~ Fixed with https://github.com/wbthomason/packer.nvim/issues/750#issuecomment-1006070458
- [ ] Write the keymaps in a doc file or something (In progress)
- [ ] Add haskell and ghci (Adding a new slime command)
- [ ] Add python repl support (Adding a new slime command)
- [ ] make markdown preview dynamic with flatpak installed browser or installed from a distro's package manager? (Hmmm)
- [ ] Replace dashboard-nvim with alpha-nvim (seems glepnir is MIA, i hope glepnir is fine)
