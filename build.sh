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

  while getopts A:K:q option
  do
    case "${option}"
    in
      q) QUIET=1;;
      A) ARCH=${OPTARG};;
      K) KERNEL=${OPTARG};;
    esac
  done

  rm -rf $build_dir
  mkdir -p $build_dir

  cd $CDIR
  cp *prerun.sh *pluginrc.* $build_dir/

  cd $build_dir

  # bat
  echo "Downloading bat..."
  _cputype="x86_64"
  _clibtype="musl"
  _ostype=unknown-linux-$_clibtype
  _target="$_cputype-$_ostype" # x86_64-unknown-linux-musl
  rm -f bat

  curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | grep "$_target" | xargs -n 1 curl -LJO
  tar -xf bat-*.tar.gz --strip-components=1 --wildcards "*/bat"
  chmod +x bat
  rm -f bat-*.tar.gz


  # eza
  echo "Downloading eza..."
  _cputype="x86_64"
  _clibtype="musl"
  _ostype=unknown-linux-$_clibtype
  _target="$_cputype-$_ostype" # x86_64-unknown-linux-musl
  rm -f eza

  curl -s https://api.github.com/repos/eza-community/eza/releases/latest | grep "browser_download_url" | cut -d '"' -f 4 | grep "$_target" | xargs -n 1 curl -LJO
  tar -xf eza_*.tar.gz --strip-components=1 --wildcards "*/eza"
  chmod +x eza
  rm -f eza_*.*

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
