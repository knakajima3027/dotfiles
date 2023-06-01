# vscode
SCRIPT_DIR="~/dotfiles/vscode"
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

chmod -R 777 ./vscode/settings.json
chmod -R 777 ./vscode/keybindings.json

sudo ln -svf "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

sudo ln -svf "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# install extention
cat ./vscode/extensions | while read line
do
 code --install-extension $line
done

code --list-extensions > extensions