# hramos dotfiles

...

## Components

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## Install

Run this:

```
git clone https://github.com/hramos/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## Homebrew

The list of apps installed by Homebrew is maintained in the Brewfile. After they are installed by Homebrew, individual apps need to be manually opened in order to acknowledge the macOS dangerous software prompt.

### Updating your Brewfile

```
brew bundle dump
```

## Visual Studio Code

> NOTE: Remove User directory in VS Code after first install. See `vscode/setup` for more.

```
./vscode/setup
```

## Configure Bash and Ruby

```
# Bash
# Make the Homebrew version of bash be the default login shell
sudo echo "/usr/local/bin/bash" >> /etc/shells
chsh -s /usr/local/bin/bash
sudo chsh -s /usr/local/bin/bash

# Bundler
GEM_HOME=~/.gem gem install bundler
```

## Next Steps

Log in to iCloud in Preferences.

Set up Touch ID and set up sudo to use it. Add the following line to `/etc/pam.d/sudo`:

```
  auth       sufficient     pam_tid.so
```

Log in to 1Password.

Grab SSH keys from backup and move to `~/.ssh/`. If using a new key, see https://docs.github.com/en/authentication/connecting-to-github-with-ssh.

- TODO: Setup `~/.ssh/config` with hosts

### Credits

Based on:

- https://github.com/noopkat/dotfiles
- https://github.com/holman/dotfiles
- https://github.com/cpojer/dotfiles
