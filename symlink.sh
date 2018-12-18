#!/bin/sh

set -ex

for file in $(echo .bash_profile .bashrc .inputrc .vim .vimrc .tmux.conf); do
   [ ! -L ~/$file ] && ln -sf ~/dotfiles/$file ~/$file
done

mkdir -p ~/.config/
[ ! -L ~/.config/nvim ] && ln -sf ~/dotfiles/nvim ~/.config/nvim

