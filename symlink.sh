#!/bin/sh

set -ex

for file in $(echo .bashrc .inputrc .vim .vimrc); do
   ln -fs ~/dotfiles/$file ~/$file
done

