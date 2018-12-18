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

Brew

* `brew install reattach-to-user-namespace` - this is used to copy from `tmux` into the clipboard (see the `.tmux.conf` for usage)
