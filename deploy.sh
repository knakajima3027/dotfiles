#!/bin/bash

DOT_DIRECTORY="${HOME}/dotfiles"

# シンボリックリンクを貼る
# シンボリックリンクを貼りたくないファイルをブラックリスト形式で書く
for file in .??*
do
    [[ "$file" == ".git" ]] && continue
    [[ "$file" == ".DS_Store" ]] && continue
    [[ "$file" == ".gitmodules" ]] && continue

    echo "$file"
    ln -svf ${DOT_DIRECTORY}/$file ${HOME}/${file}
done

# vimのカラースキーマのシンボリックリンク
ln -sf ~/dotfiles/vim/tender.vim/colors/tender.vim ~/.vim/colors/tender.vim
