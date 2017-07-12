#!/bin/sh

set -ex

for file in $(echo .bashrc .inputrc .vim .vimrc); do
   ln -fs ~/dotfiles/$file ~/$file
done

# Link vim colors
ln -s ~/dotfiles/.vim/bundle/vim-colorschemes/colors ~/dotfiles/.vim/colors
