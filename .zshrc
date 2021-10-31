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
alias cat='bat'

# alias (git)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


### zinitプラグイン
# コマンドにシンタックスハイライトをつける
zinit light zdharma/fast-syntax-highlighting

# 履歴からtab補完 「ctr + j」で補完できる
zinit light zsh-users/zsh-autosuggestions
bindkey '^j' autosuggest-accept

# ターミナルの綺麗なテーマにする (powerlevel10k)
zinit ice depth=1; zinit light romkatv/powerlevel10k

# 以下 powerlevel10kの設定
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
