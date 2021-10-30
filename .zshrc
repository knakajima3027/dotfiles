############### オプション設定 ###############
# ディレクトには'/'をつける
setopt list_types

# tab補完
autoload -U compinit
compinit

# ディレクトリ移動時に'cd'を省略できる
setopt auto_cd

# ディレクトリ移動時に自動で'ls'を実行
function chpwd() { ls }

# 補間の際に、大文字小文字の区別を無くす
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'


############### コマンド履歴 ###############
# 履歴を保存するファイル
HISTFILE=~/.zsh_history  

# メモリに保存する履歴のサイズ
HISTSIZE=3000000

# 保存する履歴のサイズ    
SAVEHIST=3000000

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# 他のシェルと履歴を共有
setopt share_history      

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forw  ard-end


############### alias ###############
# alias (ls)
#alias ls='exa -h'

# alias (cat)
#alias cat='bat'

# alias (git)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'


############### zplug (zinitが消えたので一時zplugを使う) ###############
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-history-substring-search"


### zinit用
# ターミナルの綺麗なテーマにする
#zinit ice depth=1; zinit light romkatv/powerlevel10k

# シンタックスハイライト
#zinit light zdharma/fast-syntax-highlighting

# 履歴からtab補完 「ctr + j」で補完できる
#zinit light zsh-users/zsh-autosuggestions
#bindkey '^j' autosuggest-accept