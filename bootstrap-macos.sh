# Installation
#
# git clone git@github.com:hramos/dotfiles.git $HOME/dotfiles

echo "Installing xcode-stuff"
xcode-select --install

echo "Setting up .bash_profile"
touch $HOME/.bash_profile
echo "source $HOME/dotfiles/user_profile" >> $HOME/.bash_profile

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

echo "Installing other stuff"
brew install wget
brew install nvm
brew install hub
brew install ruby
brew install bat

echo "Cleaning up brew"
brew cleanup

# Apps
apps=(
  1password
  discord
  docker
  spotify
  visual-studio-code
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask cleanup
brew cleanup

echo "Git config"

git config --global user.name "Héctor Ramos"
git config --global user.email hector@hectorramos.com

echo "Pulling down remote repositories..."
cd ~
mkdir git
cd git
git clone git@github.com:facebook/react-native.git
git clone git@github.com:facebook/react-native-website.git
git clone git@github.com:hramos/react-native-bot.git
git clone git@github.com:hramos/dotvim.git ~/.vim
cd ~

# To be replaced by a vim bootstrap
echo "Linking vimrc"
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update

echo "Set up VSCode"

ln -s $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -s $HOME/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -s $HOME/dotfiles/vscode/snippets/ $HOME/Library/Application\ Support/Code/User/snippets

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
echo "Set up Touch ID and set up sudo (view source)"
# To do so, add the following line to /etc/pam.d/sudo on a mac:
#  auth       sufficient     pam_tid.so
