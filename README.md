Collection of cli-tools I use with [xxh](https://github.com/xxh/xxh), inspired by my [dotfiles](https://github.com/ninagrosse/dotfiles). There are plugins for some of the tools already, but I prefer to have a collection of all tools I use in one plugin tailored to my needs.

Use in conjunction with [ninagrosse/xxh-plugin-zsh-ohmyzsh](https://github.com/ninagrosse/xxh-plugin-zsh-ohmyzsh) to have some handy aliases, as well as preconfigured settings and oh-my-zsh plugins.

## Included Tools

* [atuin](https://github.com/atuinsh/atuin)
* [bat](https://github.com/sharkdp/bat)
* [eza](https://github.com/eza-community/eza)
* [fd](https://github.com/sharkdp/fd)
* [fzf](https://github.com/junegunn/fzf)
* [httpie](https://httpie.io/docs/cli/installation)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [starship](https://starship.rs/guide/)
* [yazi](https://github.com/sxyazi/yazi)
* [zoxide](https://github.com/ajeetdsouza/zoxide)

> [!IMPORTANT]
> Initialization of `atuin`, `starship` and `zoxide` is not handled in `pluginrc`! This happens in [ninagrosse/xxh-plugin-zsh-ohmyzsh](https://github.com/ninagrosse/xxh-plugin-zsh-ohmyzsh).

## Install

```shell
xxh +I xxh-plugin-prerun-cli-tools+git+https://github.com/ninagrosse/xxh-plugin-prerun-cli-tools
```

## Supported xxh-shells

* [xxh-shell-zsh](https://github.com/xxh/xxh-shell-zsh)
* [xxh-shell-bash](https://github.com/xxh/xxh-shell-bash)

Add your shell by creating `pluginrc` file.

## Credits

This plugin was created with [xxh-prerun-plugin cookiecutter template](https://github.com/xxh/cookiecutter-xxh-plugin-prerun).
