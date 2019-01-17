## vim
### 初期設定  
```shell
$ cd ~  
$ git clone https://github.com/knakajima3027/dotfiles.git  
$ cd dotfiles  
$ sh intall.sh  
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```  
`:PlugInstall`   

### vscode  
```shell
$ ln -fnsv dotfiles/vscode $HOME/Library/Application Support/Code/User  
```