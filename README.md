# Provisioning a new Mac

## Command Line Tools

```
xcode-select --install
sudo xcodebuild -license
```

## SSH Keys

Grab SSH keys from backup and move to `~/.ssh/`. If using a new key, see https://docs.github.com/en/authentication/connecting-to-github-with-ssh.

- TODO: Setup `~/.ssh/config` with hosts

## Dotfiles and symlinks

```
git clone git@github.com:hramos/dotfiles.git $HOME/.home./
cd $HOME/.home
./bootstrap
```

## Homebrew

```
./homebrew
```

Individual apps need to be manually opened in order to acknowledge the macOS dangerous software prompt.

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

## macOS Preferences

```
./macos
```

> Consider using Syncalicious.

## Next Steps

Log in to iCloud in Preferences.

Set up Touch ID and set up sudo to use it. Add the following line to `/etc/pam.d/sudo`:

```
  auth       sufficient     pam_tid.so
```

Log in to 1Password.

### Credits

Inspired by https://github.com/noopkat/dotfiles and https://github.com/cpojer/dotfiles
