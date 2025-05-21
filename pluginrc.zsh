CURR_DIR="$(cd "$(dirname "$0")" && pwd)"

# oh-my-zsh location
export ZSH="$CURR_DIR/ohmyzsh"

# Setup $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# oh-my-zsh settings
export ZSH_THEME="bira"
export DISABLE_MAGIC_FUNCTIONS="true"
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"
export DISABLE_AUTO_UPDATE=true

# eza plugin settings
zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'icons' yes

# oh-my-zsh plugins
export plugins=(git
  history
  common-aliases
  rsync
  ssh
  zsh-autosuggestions
  zsh-syntax-highlighting
  systemadmin
  eza
  fzf
  zoxide)

# load oh-my-zsh
source $CURR_DIR/ohmyzsh/oh-my-zsh.sh
autoload -U compinit && compinit

# Set $EDITOR to nvim
export EDITOR='nvim'

# Alias to reload zsh (e.g. after editing .zshrc or editing plugins)
alias src='source $XXH_HOME/.xxh/plugins/xxh-plugin-zsh-ohmyzsh/build/pluginrc.zsh'

# Init Starship prompt
eval "$(starship init zsh)"

# Replace cat with bat
alias cat='bat'

# More eza aliases
alias l='ll'             # make alias l the same as ll (eza -gl)
alias lt='ls --tree'     # tree alias (ls is already aliased to eza)
alias lat='ls -a --tree' # tree alias including hidden folder/files

# Alias to pipe output to fzf with 'command F' instead of 'command | fzf'
alias -g F="| fzf"

# Use bat & eza previews in fzf
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
  cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
  *) fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# Function for yazi to start it with just a 'y' and cd into the directory, you're currently in, when exiting yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
  echo -e -n "\x1b[0 q" # reset cursor to terminal emulator default
}

# Replace cd with z (zoxide)
alias cd="z"

# Initialize atuin
eval "$(atuin init zsh)"

# Load machine specific aliases, environment variables etc. from $HOME/.zshrc.local.zsh, if the file exists
[[ -f $HOME/.zshrc.local.zsh ]] && source $HOME/.zshrc.local.zsh
