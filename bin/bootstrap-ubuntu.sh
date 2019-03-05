# Installation
#
# git clone git@github.com:hramos/dotfiles.git $HOME/dotfiles

echo "Setting up .bash_profile"
touch $HOME/.bash_profile
echo "source $HOME/dotfiles/user_profile" >> $HOME/.bash_profile

echo "Setting up git"
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
fi
git config --global user.name "Héctor Ramos"
git config --global user.email hector@hectorramos.com

echo "Pulling down remote repositories..."
cd ~
mkdir git
cd git
git clone git@github.com:facebook/react-native.git
git clone git@github.com:facebook/react-native-website.git
cd ~

# Set up vim
./bin/vim-setup.sh

# Install applications
sudo dpkg -i bat_0.10.0_amd64.deb

echo "Done!"

echo "Next Steps:"
echo "Copy your private SSH keys"
