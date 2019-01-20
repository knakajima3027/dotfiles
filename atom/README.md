# Atomのパッケージの管理  
## 新規環境構築時 
```
cd ~/dotfiles/atom  
apm install --packages-file packages.txt  
```  

## 新規追加(コミット時)  
```
cd ~/dotfiles/atom
apm list --installed --bare > packages.txt  
```
