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

# Aliases
# Amend to the last commit, without editing the commit message.
# Usage: git amend
git config --global alias.amend '!git add -A && git commit --amend --no-edit'

# Quick commit.
# Usage: git c <commit message>
git config --global alias.c '!git add -A && git commit -m'

# Sync with the remote. Fetches and rebases local commits.
# Usage: git f
git config --global alias.f '!git fetch --all && git rebase origin/master'

# Start a new branch.
# Usage: git n <branch name>
git config --global alias.n '!git checkout -b'

# Push to the current remote branch at origin.
# Usage: git p
git config --global alias.p '!git push origin $(git rev-parse --abbrev-ref HEAD)'

# Push to the current remote branch at our fork.
# Usage: git pf
git config --global alias.pf '!git push fork $(git rev-parse --abbrev-ref HEAD)'

# Status
# Usage: git st
git config --global alias.st '!git status'

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
