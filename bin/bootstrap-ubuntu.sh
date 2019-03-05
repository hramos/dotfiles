# Installation
#
# git clone git@github.com:hramos/dotfiles.git $HOME/dotfiles

echo "Setting up .bash_profile"
touch $HOME/.bash_profile
echo "source $HOME/dotfiles/user_profile" >> $HOME/.bash_profile

GIT_REPOSITORY_PATH="$HOME/git"

echo "Setting up git"
if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
fi
git config --global user.name "Héctor Ramos"
git config --global user.email hector@hectorramos.com

echo "Pulling down remote repositories..."
if [ ! -d "$GIT_REPOSITORY_PATH" ]; then
  mkdir $GIT_REPOSITORY_PATH 
fi

if [ ! -d "$GIT_REPOSITORY_PATH/react-native" ]; then
  git clone git@github.com:facebook/react-native.git $GIT_REPOSITORY_PATH/react-native
  (cd $GIT_REPOSITORY_PATH/react-native && git remote add fork git@github.com:hramos/react-native.git)
fi
if [ ! -d "$GIT_REPOSITORY_PATH/react-native-website" ]; then
  git clone git@github.com:facebook/react-native-website.git $GIT_REPOSITORY_PATH/react-native-website
  (cd $GIT_REPOSITORY_PATH/react-native-website && git remote add fork git@github.com:hramos/react-native-website.git)
fi
if [ ! -d "$GIT_REPOSITORY_PATH/react-native-bot" ]; then
  git clone git@github.com:hramos/react-native-bot.git $GIT_REPOSITORY_PATH/react-native-bot
fi

# Set up vim
source $HOME/dotfiles/bin/vim-setup.sh

echo "Done!"

echo "Next Steps:"
echo "Copy your private SSH keys"
