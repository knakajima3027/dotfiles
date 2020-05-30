# zplugの設定
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplugプラグイン
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"
zplug "zsh-users/zsh-autosuggestions"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

# zplugの設定ここまで

# プロンプトの設定
autoload -U promptinit; promptinit
prompt pure

# Pyhon関連
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#npm
export PATH=$HOME/.nodebrew/current/bin:$PATH
