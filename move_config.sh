#!/bin/bash

mkdir -p ~/dotfiles/$1/.config
mv ~/.config/$1 ~/dotfiles/$1/.config
cd ~/dotfiles
stow $1
