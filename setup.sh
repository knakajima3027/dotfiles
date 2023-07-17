#!/bin/sh

has() {
  type "$1" > /dev/null 2>&1
}

# --- brew ---
# brewのインストール
if has "brew"; then
  echo "Already installed Homebrew"
else
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# 各種パッケージのインストール
if has "brew"; then
  echo "Updating Homebrew..."
  brew update && brew upgrade

  brew tap homebrew/cask-fonts

  local list_formulae
  local -a missing_formulae=()
  local -a desired_formulae=(
    "bash-completion"
    "git"
    "tmux"
    "bat"
    "jq"
    "exa"
    "fzf"
    "git-delta"
    "ripgrep"
    "font-hackgen"
  )

  local installed_formulae=`brew list`

  # desired_formulaeで指定していて、インストールされていないパッケージをインストール
  for index in ${!desired_formulae[*]}
  do
    local formulae=`echo ${desired_formulae[$index]} | cut -d' ' -f 1`
    if [[ -z `echo "${installed_formulae}" | grep "^${formulae}$"` ]]; then
      missing_formulae=("${missing_formulae[@]}" "${desired_formulae[$index]}")
    else
      echo "Installed ${formulae}"
    fi
  done

  if [[ "$missing_formulae" ]]; then
    list_formulae=$( printf "%s " "${missing_formulae[@]}" )

    echo "Installing missing brew formulae..."
    brew install $list_formulae
  fi

  # cask
  local -a missing_cask_formulae=()
  local -a desired_cask_formulae=(
    "1password"
    "alfred"
    "clipy"
    "deepl"
    "docker"
    "dropbox"
    "google-chrome"
    "google-japanese-ime"
    "hyperswitch"
    "iTerm2"
    "spotify"
    "kindle"
    "typora"
    "visual-studio-code"
  )

  local cask_installed=`brew list --cask`

  # desired_cask_formulaeで指定していて、インストールされていないパッケージをインストール
  for index in ${!desired_cask_formulae[*]}
  do
    local cask_formulae=`echo ${desired_cask_formulae[$index]} | cut -d' ' -f 1`
    if [[ -z `echo "${installed_cask_formulae}" | grep "^${cask_formulae}$"` ]]; then
      missing_cask_formulae=("${missing_cask_formulae[@]}" "${desired_cask_formulae[$index]}")
    else
      echo "Installed ${cask_formulae}"
    fi
  done

  if [[ "$missing_cask_formulae" ]]; then
    cask_list_formulae=$( printf "%s " "${missing_cask_formulae[@]}" )

    echo "Installing missing brew formulae..."
    brew install $cask_list_formulae
  fi

  echo "Cleanup Homebrew..."
  brew cleanup
fi


# --- Shell ---
# シェルはzshを利用する
[ ${SHELL} != "/bin/zsh"  ] && chsh -s /bin/zsh

# --- git submodule ---
# 初期化 & 更新
git submodule init  && git submodule update

# --- mkdir ---
mkdir -p ~/.vim/colors

# fzf

# --- zinit ---
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/master/doc/install.sh)"

# --- vim-plug ---
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# iterm2 テーマ設定
git clone https://github.com/mbadolato/iTerm2-Color-Schemes ~/iTerm2-Color-Schemes

~/iTerm2-Color-Schemes/tools/import-scheme.sh ~/iTerm2-Color-Schemes/schemes/*

~/iTerm2-Color-Schemes/tools/import-scheme.sh -v ~/iTerm2-Color-Schemes/schemes/*

~/iTerm2-Color-Schemes/tools/import-scheme.sh "Monokai Soda"

# Macの設定
# 隠しファイルを表示する
defaults write com.apple.finder AppleShowAllFiles -bool true

# .DS_Storeファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# 設定反映
killall Finder
