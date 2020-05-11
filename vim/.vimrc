"カラースキーマの設定
syntax enable
colorscheme tender


"エディタの基本設定
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

" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase

" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

" 検索時に最後まで行ったら最初に戻る
set wrapscan

" 検索語をハイライト表示
set hlsearch
