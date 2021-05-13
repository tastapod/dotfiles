# Daniel's dot files

Clone this repository into your home directory, then link the files like this:

Note: _this will replace your dotfiles_, so move them out of the way first!

1. Install [Oh my zsh!](https://ohmyz.sh/#install) 

2. Run the following:

    ```
    cd
    git clone https://github.com/tastapod/dotfiles.git .config/tastapod/dotfiles
    for f in .config/tastapod/dotfiles/*; do ln -f -s "$f" ".${f##*/}"; done
    ```

(If you get an error from `xcrun` you need to run `xcode-select --install` first.)

3. Add any host-specific settings in `.zlogin`, which is sourced after
`.zshenv` and `.zshrc` for a login shell.
