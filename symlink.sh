#!/bin/sh

set -ex

for file in $(echo .bash_profile .bashrc .inputrc .vim .vimrc); do
   [ ! -L ~/$file ] && ln -sf ~/dotfiles/$file ~/$file
done

