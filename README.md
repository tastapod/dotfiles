# Daniel's dot files

I was using [Oh My Zsh](https://ohmyz.sh) but I found it a bit sluggish. I have migrated to [antidote](https://antidote.sh) with a few plugins in [.zsh_plugins.txt](.zsh_plugins.txt).

## Installation

_Note: this will replace your dot files, so move them out of the way first!_

Clone this repository from your home directory, then link the files:

```zsh
cd
git clone https://github.com/tastapod/dotfiles.git .config/tastapod/dotfiles
ln -vsf .config/tastapod/dotfiles/{.*(.),Brewfile} .
```

This creates symlinks for all the dot files plus some extras (for now just the `Brewfile`).

## Notes

1. You do not need to install `antidote`, it bootstraps automatically.

1. If you get an error from `xcrun` you need to run `xcode-select --install` first.

1. Add any host-specific settings in `~/.zlogin`, which is sourced last for a login shell. I use this for local tool and language installation:
    - homebrew
    - Go, Python (using [uv](https://docs.astral.sh/uv/)), Ruby, Rust, JavaScript
    - [Hugo](https://gohugo.io)
