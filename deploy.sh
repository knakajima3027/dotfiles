#!/bin/bash

# シンボリックリンクを貼る
# シンボリックリンクを貼りたくないファイルをブラックリスト形式で書く
for file in .??*
do
    [[ "$file" == ".git" ]] && continue
    [[ "$file" == ".DS_Store" ]] && continue

    echo "$file"
    ln -svf $file ~/
done