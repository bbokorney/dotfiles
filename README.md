# dotfiles

## Usage

```
$ cd ~
$ git clone --recursive git@github.com:bbokorney/dotfiles.git
$ sh ./dotfiles/symlink.sh
```

## Additional Setup

* Run `:PlugInstall` in Neovim

## Mac

### iTerm color scheme
[Follow installation instructions here](https://github.com/one-dark/iterm-one-dark-theme)

[Download theme here](https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/Molokai.itermcolors)

Brew

* `brew install reattach-to-user-namespace` - this is used to copy from `tmux` into the clipboard (see the `.tmux.conf` for usage)
