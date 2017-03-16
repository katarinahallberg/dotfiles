# dotfiles

Originally forked from https://github.com/frippz/dotfiles, so thanks to [Fredrik Frodlund](https://github.com/frippz) for a starting point and help.

*.symlink files will be symlinked in your home folder on when `script/bootstrap` is executed

*.sh files will be executed when `script/install` is executed (no installation files at the moment)

*.zsh files will be run on shell startup

## Usage

1. Clone this repo

1. Rename the folder of the clone to '.dotfiles' (adding the .)

1. Make sure you're running `zsh`, since many of the dotfiles assumes this.

```zsh
$ chsh -s $(which zsh)
```

1. Bootstrap!

```zsh
$ script/bootstrap
```

1. Install (no installation files at the moment)

```zsh
$ script/install
```

All done!


## Known issues

* /Users/katarinahallberg/.dotfiles/zsh/config.zsh:3: no matches found: /Users/katarinahallberg/.dotfiles/functions/*(:t)
