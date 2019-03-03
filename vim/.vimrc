"本設定
syntax enable

filetype plugin indent on

"エディタの設定
"行番号を表示
set number

"Tab幅をスペース2つ分に
set tabstop=2

"検索関連
"検索文字列が小文字の時、大文字も含めて検索
set ignorecase


call plug#begin('~/.vim/plugged')

Plug 'ujihisa/unite-colorscheme'

Plug 'tomasr/molokai'

call plug#end()
