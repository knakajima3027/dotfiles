## 初期設定  
```shell
$ cd ~  
$ git clone --recursive git://github.com/knakajima3027/dotfiles  
$ cd dotfiles  
$ sh setup.sh  
```  
## 各種設定ファイル
### setup.sh
新しい環境になった時に1度だけ実行する。
### deploy.sh
シンボリックリンクを貼りたいファイルが増えた時、貼りなおしたい時に実行する。
### .gitmodules
dotfileに入れておきたい他のリポジトリのコードを取得する。vimのカラースキーマなど。

