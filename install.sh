#!/usr/bin/env bash

DIR=$(dirname ${BASH_SOURCE[0]})

echo linking .bashrc
ln -s $DIR/.bashrc ~/.bashrc
echo linking .vimrc
ln -s $DIR/.vimrc ~/.vimrc
echo linking .vim
ln -s $DIR/.vim ~/.vim
echo installing plugins
echo $(vim +PluginInstall +qall >/dev/null && echo success || echo failure)

echo linking zshrc
ln -s $DIR/.zshrc ~/.zshrc
echo linking oh-my-zsh
ln -s $DIR/.oh-my-zsh ~/.oh-my-zsh
echo attempting to change shell
chsh -s `which zsh`

