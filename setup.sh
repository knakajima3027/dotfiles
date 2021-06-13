#!/bin/sh
# alias
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.inputrc ~/.inputrc
mkdir ~/.vim/colors
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/molokai/colors/molokai.vim ~/.vim/colors/molokai.vim
ln -sf ~/dotfiles/vim/tender.vim/colors/tender.vim ~/.vim/colors/tender.vim

# install bash-completion
brew install bash-completion

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
