Collection of cli-tools I use with [xxh](https://github.com/xxh/xxh), inspired by my [dotfiles](https://github.com/ninagrosse/dotfiles). There are plugins for some of the tools already, but I prefer to have a collection of all tools I use in one plugin tailored to my needs.

## Included Tools

* [atuin](https://github.com/atuinsh/atuin)
* [bat](https://github.com/sharkdp/bat)
* [eza](https://github.com/eza-community/eza)
* [fd](https://github.com/sharkdp/fd)
* [fzf](https://github.com/junegunn/fzf)
* [httpie](https://httpie.io/docs/cli/installation)
* [Neovim](https://github.com/neovim/neovim)
* [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) + [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) + [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [starship](https://starship.rs/guide/)
* [yazi](https://github.com/sxyazi/yazi)
* [zoxide](https://github.com/ajeetdsouza/zoxide)

> [!IMPORTANT]
> Config files for some tools are copied from the local `$HOME/.config` and are then symlinked to xxh's `$XDG_CONFIG_HOME` on the remote host. Neovim uses my minimal config which can be fount at [ninagrosse/minimal-nvim](https://github.com/ninagrosse/minimal-nvim)

## Install

```shell
xxh +I xxh-plugin-prerun-cli-tools+git+https://github.com/ninagrosse/xxh-plugin-prerun-cli-tools
```

## Supported xxh-shells

* [xxh-shell-zsh](https://github.com/xxh/xxh-shell-zsh)

## Credits

This plugin was created with [xxh-prerun-plugin cookiecutter template](https://github.com/xxh/cookiecutter-xxh-plugin-prerun).
