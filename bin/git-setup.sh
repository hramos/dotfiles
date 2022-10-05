#!/usr/bin/env bash

echo "Setting up git"

GIT_USER="hramos"
BASE_DIR="$HOME/git"
REPOS=(
  "facebook/react-native"
  "facebook/react-native-website"
  "hramos/react-native-bot"
)

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  exit 1
fi

# User
git config --global user.name "Héctor Ramos"
git config --global user.email hector@hectorramos.com

# Remotes
echo "Pulling down remote repositories..."
mkdir -p $BASE_DIR

for REPO in ${REPOS[@]}; do
  REPOOWNER="$(dirname $REPO)"
  REPONAME="$(basename $REPO)"
  if [ ! -d "$BASE_DIR/$REPONAME" ]; then
    git clone git@github.com:$REPO.git $BASE_DIR/$REPONAME
    if [ "$GIT_USER" != "$REPOOWNER" ]; then
      # Add my forks as remotes if I don't own this repo
      (cd $BASE_DIR/$REPONAME && git remote add fork "git@github.com:$GIT_USER/$REPONAME.git")
    fi
  fi
done
