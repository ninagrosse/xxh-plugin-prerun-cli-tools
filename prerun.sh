CURR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
export PATH=$CURR_DIR:$PATH

# Symlink config files
rm -rf $XDG_CONFIG_HOME/atuin
ln -s $CURR_DIR/.config/atuin $XDG_CONFIG_HOME/atuin

rm -rf $XDG_CONFIG_HOME/bat
ln -s $CURR_DIR/.config/bat $XDG_CONFIG_HOME/bat
bat cache --build

rm -rf $XDG_CONFIG_HOME/yazi
ln -s $CURR_DIR/.config/yazi $XDG_CONFIG_HOME/yazi
