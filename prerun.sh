CURR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
export PATH=$CURR_DIR:$PATH

# Symlink config files, which where copied during build.sh, to xxh's $XDG_CONFIG_HOME (only when symlinks don't exist)
if [[ ! -L $XDG_CONFIG_HOME/atuin ]]; then
  rm -rf $XDG_CONFIG_HOME/atuin # atuin recreates it's default config on every use, if none exists, so delete it first before symlinking the copied config
  ln -s $CURR_DIR/.config/atuin $XDG_CONFIG_HOME/atuin
fi

if [[ ! -L $XDG_CONFIG_HOME/bat ]]; then
  ln -s $CURR_DIR/.config/bat $XDG_CONFIG_HOME/bat
  bat cache --build # rebuild cache so bat picks up Catppuccin Mocha theme
fi

if [[ ! -L $XDG_CONFIG_HOME/httpie ]]; then
  ln -s $CURR_DIR/.config/httpie $XDG_CONFIG_HOME/httpie
fi

if [[ ! -L $XDG_CONFIG_HOME/nvim ]]; then
  ln -s $CURR_DIR/.config/minimal-nvim $XDG_CONFIG_HOME/nvim
fi

if [[ ! -L $XDG_CONFIG_HOME/yazi ]]; then
  ln -s $CURR_DIR/.config/yazi $XDG_CONFIG_HOME/yazi
fi
