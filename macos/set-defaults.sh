# Sets reasonable macOS defaults.

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

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 1

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Run the screensaver if we're in the bottom-left hot corner.
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 0

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

killall Finder

echo "Done!"
