# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

############### 補完 ###############
autoload -U compinit
compinit

# 補間の際に、大文字小文字の区別を無くす
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'


############### コマンド履歴 ###############
# コマンド履歴
HISTFILE=~/.zsh_history   # 履歴を保存するファイル
HISTSIZE=6000000          # メモリに保存する履歴のサイズ
SAVEHIST=6000000          # 保存する履歴のサイズ
setopt hist_ignore_dups   # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history      # 他のシェルと履歴をリアルタイムでシェア


############### コマンド履歴検索 ###############
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


############### alias ###############
# alias (ls)
alias ls='ls -G'
alias la='ls -a'

# alias (git)
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gb = 'git branch'
alias gco = 'git checkout'
alias gcb = 'git checkout -b'


############### その他 ###############
# Pyhon関連
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# npm
export PATH=$HOME/.nodebrew/current/bin:$PATH

############### zplug ###############
source ~/.zplug/init.zsh


############### zinit ###############
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

SCRIPT_DIR=$HOME/dotfiles

source $SCRIPT_DIR/zsh/plugins.zsh
source $SCRIPT_DIR/zsh/config.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
