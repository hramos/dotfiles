# Installation
#
# git clone git@github.com:hramos/dotfiles.git $HOME/dotfiles

echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  sudo chown -R $(whoami) /usr/local/lib /usr/local/sbin
fi

# Bundler
echo "Ruby Gem Bundler"
GEM_HOME=~/.gem gem install bundler

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing bash"
brew install bash
# Make this bash version be the default login shell
sudo echo "/usr/local/bin/bash" >> /etc/shells
chsh -s /usr/local/bin/bash
sudo chsh -s /usr/local/bin/bash

echo "Installing other stuff"
brews=(
  bat
  delta
  gh
  nvm
  ruby
  wget
  yarn
  z
)
brew install ${brews[@]}

echo "Cleaning up brew"
brew cleanup

# Apps
apps=(
  1password
  discord
#  docker
  spotify
#  visual-studio-code
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask cleanup
brew cleanup

# Set up git and most used repos
source "$HOME/dotfiles/bin/git-setup.sh"

# Set up vim
source "$HOME/dotfiles/bin/vim-setup.sh"

# Set up VSCode
./vscode/setup

echo "Setting some Mac settings..."

# Enabling full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Avoiding the creation of .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Setting screenshots location to ~/Desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Setting screenshot format to PNG
defaults write com.apple.screencapture type -string "png"

# Enable right click
defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string "TwoButton"

# Enable right click and tap to click
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -boolean YES
defaults write com.apple.AppleMultitouchTrackpad TrackpadClicking -boolean YES

# Turn off Dock bounce
defaults write com.apple.dock no-bouncing -bool TRUE

killall Finder


echo "Done!"

echo "Next Steps:"
echo "Log in to iCloud on Preferences"
echo "Install Xcode"
echo "Copy your private SSH keys"
echo "Run the bootstrap script:"
echo "./$HOME/dotfiles/bootstrap"
echo "Set up Touch ID and set up sudo (view source)"
# To do so, add the following line to /etc/pam.d/sudo on a mac:
#  auth       sufficient     pam_tid.so
