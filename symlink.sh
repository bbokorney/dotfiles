#!/bin/sh

set -ex

for file in $(echo .bash_profile .bashrc .inputrc .vim .vimrc); do
   [ ! -L ~/$file ] && ln -sf ~/dotfiles/$file ~/$file
done

[ ! -L ~/.config/nvim ] && ln -sf ~/dotfiles/nvim ~/.config/nvim

