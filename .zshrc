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
bindkey "^N" history-beginning-search-forward-end

# fzfの設定
export FZF_DEFAULT_OPTS='--height 70% --reverse --border --exact'

# コマンド履歴の検索関数
function select-history-widget() {
    BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
    CURSOR=$#BUFFER
}

# fzfのGitブランチ切り替え関数
function fzf-git-branch-widget() {
    local selected_branch
    selected_branch=$(git branch --all --color=always | grep -v '/HEAD' | fzf +m --ansi)
    if [[ -n "$selected_branch" ]]; then
        git checkout $(echo "$selected_branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
    fi
}

# fzfのファイル検索関数
function fzf-file-widget() {
    local selected_file
    selected_file=$(find . -type f | fzf +m --preview 'bat --color=always {}' --preview-window=':wrap')
    if [[ -n "$selected_file" ]]; then
        LBUFFER="vim $selected_file"
        zle accept-line
    fi
}

zle -N select-history-widget
zle -N fzf-git-branch-widget
zle -N fzf-git-file-widget
bindkey "^r" select-history-widget
bindkey '^b' fzf-git-branch-widget
bindkey '^t' fzf-git-file-widget

############### alias ###############
# alias (ls)
alias ls='exa -h --icons'

# alias (git)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'


############### zinit ###############
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# プロンプトテーマ"romkatv/powerlevel10k"をインストール
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# powerlevel10kの設定
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# syntax系のプラグインをまとめてインストール
# https://zdharma-continuum.github.io/zinit/wiki/For-Syntax/
zinit for \
    light-mode \
  zsh-users/zsh-autosuggestions \
    light-mode \
  zdharma-continuum/fast-syntax-highlighting \
  zdharma-continuum/history-search-multi-word \
    light-mode \
    pick"async.zsh" \
    src"pure.zsh" \
  sindresorhus/pure

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
