#!/bin/sh
mkdir ~/.vim/colors
ln -sf ~/dotfiles/vim/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim
ln -sf ~/dotfiles/vim/tender.vim/colors/tender.vim ~/.vim/colors/tender.vim

ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
