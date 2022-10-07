# Installation
#
# git clone git@github.com:hramos/dotfiles.git $HOME/dotfiles

echo "Setting up .bash_profile"
touch $HOME/.bash_profile
echo "source $HOME/dotfiles/user_profile" >> $HOME/.bash_profile

# Set up git and most used repos
source "$HOME/dotfiles/bin/git-setup.sh"

# Set up vim
source $HOME/dotfiles/bin/vim-setup.sh

echo "Done!"

echo "Next Steps:"
echo "Copy your private SSH keys"
