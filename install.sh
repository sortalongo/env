#!/usr/bin/env bash

DIR=$(dirname ${BASH_SOURCE[0]})

pushd $DIR

git submodule update --recursive --init

popd

echo linking .bashrc
ln -s $DIR/.bashrc ~/.bashrc
echo linking .vimrc
ln -s $DIR/.vimrc ~/.vimrc
echo linking .vim
ln -s $DIR/.vim ~/.vim
mkdir $DIR/.vim/tmp $DIR/.vim/backup
echo installing plugins
echo $(vim +PluginInstall +qall >/dev/null && echo success || echo failure)

echo linking zshrc
ln -s $DIR/.zshrc ~/.zshrc
echo linking oh-my-zsh
ln -s $DIR/.oh-my-zsh ~/.oh-my-zsh
echo attempting to change shell
chsh -s `which zsh`

