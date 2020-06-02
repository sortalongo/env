#!/usr/bin/env bash

echo WARNING: Run this script from outside of ~/env

DIR=$(dirname ${BASH_SOURCE[0]})

pushd $DIR

git submodule update --recursive --init

popd

echo linking .bashrc
ln -sb $DIR/.bashrc ~/.bashrc
echo linking .gitconfig
ln -sb $DIR/.gitconfig ~/.gitconfig
echo linking .hgignore
ln -sb $DIR/.hgignore ~/.hgignore
echo linking .vimrc
ln -sb $DIR/.vimrc ~/.vimrc
echo linking .vim
ln -sb $DIR/.vim ~/.vim
mkdir -p $DIR/.vim/tmp $DIR/.vim/backup
echo installing plugins
echo $(vim +PluginInstall +qall >/dev/null && echo success || echo failure)

echo linking zshrc
ln -sb $DIR/.zshrc ~/.zshrc
echo linking oh-my-zsh
ln -sb $DIR/.oh-my-zsh ~/.oh-my-zsh

echo TODO:
echo '- Change shell to zsh: $ chsh -s `which zsh`'
echo '- Install keyboard layout. See env/xyup for instructions.'


