#!/usr/bin/env bash

main() {
  need_cmd curl
  need_cmd grep
  need_cmd cut
  need_cmd xargs
  need_cmd chmod
  build
}

build() {

  CDIR="$(cd "$(dirname "$0")" && pwd)"
  build_dir=$CDIR/build

  while getopts A:K:q option; do
    case "${option}" in
    q) QUIET=1 ;;
    A) ARCH=${OPTARG} ;;
    K) KERNEL=${OPTARG} ;;
    esac
  done

  rm -rf $build_dir
  mkdir -p $build_dir
  mkdir -p $build_dir/.config

  cd $CDIR
  cp *prerun.sh *pluginrc.* $build_dir/

  cd $build_dir

  # atuin
  echo "Downloading atuin..."
  _target="x86_64-unknown-linux-musl"
  rm -f atuin
  curl -s https://api.github.com/repos/atuinsh/atuin/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | grep "$_target" | xargs -n 1 curl -LJO
  tar -xf atuin-*.tar.gz --strip-components=1 --wildcards "*/atuin"
  chmod +x atuin
  rm -f atuin-*
  cp -RL $HOME/.config/atuin $build_dir/.config/

  # bat
  echo "Downloading bat..."
  _target="x86_64-unknown-linux-musl"
  rm -f bat
  curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | grep "$_target" | xargs -n 1 curl -LJO
  tar -xf bat-*.tar.gz --strip-components=1 --wildcards "*/bat"
  chmod +x bat
  rm -f bat-*.tar.gz
  cp -RL $HOME/.config/bat $build_dir/.config/

  # eza
  echo "Downloading eza..."
  _target="x86_64-unknown-linux-musl"
  rm -f eza

  curl -s https://api.github.com/repos/eza-community/eza/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | grep "$_target" | xargs -n 1 curl -LJO
  tar -xf eza_*.tar.gz --strip-components=1 --wildcards "*/eza"
  chmod +x eza
  rm -f eza_*.*

  # fd
  echo "Downloading fd..."
  _target="x86_64-unknown-linux-musl"
  rm -f fd

  curl -s https://api.github.com/repos/sharkdp/fd/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | grep "$_target" | xargs -n 1 curl -LJO
  tar -xf fd-*.tar.gz --strip-components=1 --wildcards "*/fd"
  chmod +x fd
  rm -f fd-*.*

  # fzf
  echo "Downloading fzf..."
  _target="linux_amd64"
  rm -f fzf

  curl -s https://api.github.com/repos/junegunn/fzf/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | grep "$_target" | xargs -n 1 curl -LJO
  tar -xf fzf-*.tar.gz
  chmod +x fzf
  rm -f fzf-*.*

  # httpie
  echo "Downloading httpie..."
  rm -f http*

  curl -L -o http https://packages.httpie.io/binaries/linux/http-latest
  ln -s ./http ./https
  chmod +x ./http ./https

  # yazi
  echo "Downloading yazi..."
  _target="x86_64-unknown-linux-musl"
  rm -f yazi ya
  curl -s https://api.github.com/repos/sxyazi/yazi/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | grep "$_target" | xargs -n 1 curl -LJO
  unzip -j yazi-*.zip yazi-x86_64-unknown-linux-musl/ya yazi-x86_64-unknown-linux-musl/yazi
  chmod +x yazi ya
  rm -f yazi-*.zip
  cp -RL $HOME/.config/yazi $build_dir/.config/

  # ripgrep
  echo "Downloading ripgrep..."
  _target="x86_64-unknown-linux-musl"
  rm -f rg

  curl -s https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | grep "$_target" | xargs -n 1 curl -LJO
  tar -xf ripgrep-*.tar.gz --strip-components=1 --wildcards "*/rg"
  chmod +x rg
  rm -f ripgrep-*.*

  # starship
  echo "Downloading starship..."
  _target="x86_64-unknown-linux-musl"
  rm -f starship

  curl -s https://api.github.com/repos/starship/starship/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | grep "$_target" | xargs -n 1 curl -LJO
  tar -xf starship-*.tar.gz
  chmod +x starship
  rm -f starship-*.*

  # zoxide
  echo "Downloading zoxide..."
  _target="x86_64-unknown-linux-musl"
  rm -f zoxide

  curl -s https://api.github.com/repos/ajeetdsouza/zoxide/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | grep "$_target" | xargs -n 1 curl -LJO
  tar -xf zoxide-*.tar.gz zoxide
  chmod +x zoxide
  rm -f zoxide-*.*
}

cmd_chk() {
  >&2 echo Check "$1"
  command -v "$1" >/dev/null 2>&1
}

need_cmd() {
  if ! cmd_chk "$1"; then
    error "need $1 (command not found)"
    exit 1
  fi
}

main "$@" || exit 1
