Collection of cli-tools I use with [xxh](https://github.com/xxh/xxh). There are plugins for some of the tools already, but I prefer to have a collection of all tools I use in one plugin tailored to my needs. <!-- Use in conjunction with ninagrosse/xxh-plugin-zsh and ninagrosse/xxh-plugin-prerun-dotfiles to have some handy aliases as well as preconfigured settings and oh-my-zsh plugins. -->

## Included Tools

Tools alsready included are marked ✅. Others are still work in progress.

| Name      | Description                           | Source                                               | Included |
| --------- | ------------------------------------- | -----------------------------------------------------| -------- |
| bat       | Alternative to `cat`                  | [GitHub](https://github.com/sharkdp/bat)             | ✅      |
| eza       | Alternative to `ls`                   | [GitHub](https://github.com/eza-community/eza)       | ✅      |
| fd        | Alternative to `find`                 | [GitHub](https://github.com/sharkdp/fd)              | ✅      |
| fzf       | A command-line fuzzy finder           | [GitHub](https://github.com/junegunn/fzf)            |          |
| httpie    | A better `curl` for using APIs        | [Website](https://httpie.io/docs/cli/installation)   |          |
| lf        | Terminal File Manager                 | [GitHub](https://github.com/gokcehan/lf)             |          |
| nnn       | Terminal File Manager                 | [GitHub](https://github.com/jarun/nnn)               |          |
| starship  | Cross-Platform shell prompt           | [Website](https://starship.rs/guide/)                |          |
| ugrep     | Alternative to `grep`                 | [Website](https://ugrep.com/)                        |          |
| zoxide    | A smart `cd`                          | [GitHub](https://github.com/ajeetdsouza/zoxide)      |          |

## Install
```shell
xxh +I xxh-plugin-prerun-cli-tools+git+https://github.com/ninagrosse/xxh-plugin-prerun-cli-tools
```

## Usage
```shell
```

## Supported xxh-shells

* [xxh-shell-zsh](https://github.com/xxh/xxh-shell-zsh)
* [xxh-shell-bash](https://github.com/xxh/xxh-shell-bash)

Add your shell by creating `pluginrc` file.

## Credits

This plugin was created with [xxh-prerun-plugin cookiecutter template](https://github.com/xxh/cookiecutter-xxh-plugin-prerun).
