#!/usr/bin/env bash

# Do this from outside of ~/env

DIR=$(dirname ${BASH_SOURCE[0]})

pushd $DIR

git submodule update --recursive --init

popd

echo linking .bashrc
ln -s $DIR/.bashrc ~/.bashrc
echo linking .gitconfig
ln -s $DIR/.gitconfig ~/.gitconfig
echo linking .hgignore
ln -s $DIR/.hgignore ~/.hgignore
echo linking .vimrc
ln -s $DIR/.vimrc ~/.vimrc
echo linking .vim
ln -s $DIR/.vim ~/.vim
mkdir -p $DIR/.vim/tmp $DIR/.vim/backup
echo installing plugins
echo $(vim +PluginInstall +qall >/dev/null && echo success || echo failure)

echo linking zshrc
ln -s $DIR/.zshrc ~/.zshrc
echo linking oh-my-zsh
ln -s $DIR/.oh-my-zsh ~/.oh-my-zsh
echo attempting to change shell
chsh -s `which zsh`


