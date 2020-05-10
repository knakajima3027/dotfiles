"構文毎に色分け
syntax enable
colorscheme molokai

"ファイル拡張子の検出
filetype plugin indent on

"エディタの設定
"行番号を表示
set number

" 現在の行を強調表示
set cursorline

" インデントはスマートインデント
set smartindent

" 括弧入力時の対応する括弧を表示
set showmatch

" コマンドラインの補完
set wildmode=list:longest


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-

" Tab文字を半角スペースにする
set expandtab

" 行頭以外のTab文字の表示幅
set tabstop=2

"検索関連
"検索文字列が小文字の時、大文字も含めて検索
set ignorecase
