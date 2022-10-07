#!/bin/sh
# Setup a machine for VSCode
# Place VSCode User configuration files in vscode/User, which will be symlinked to the VSCode user dir.

set -x

if test ! "$(uname)" = "Darwin"
  then
  exit 0
fi

# Some of my machines use a custom VS Code install, in which
# case the VSCODE_DIR envvar will be set.
vscode_dir=${VSCODE_DIR:-~/Library/Application\ Support/Code}
if [[ ! -d $VSCODE_DIR ]]; then
    echo "Could not locate Visual Studio Code at $VSCODE_DIR"
    echo "Reminder: you may set the VSCODE_DIR envvar if you happen to have a fork of VSCode installed elsewhere..."
    exit 1
fi

vscode_user_dir="$vscode_dir/User"

if [[ ! -L "$vscode_user_dir" ]]; then
    mv "$vscode_user_dir" "$vscode_dir/User.bku"
    ln -s "$PWD/User" "$vscode_user_dir"
fi

code --install-extension adpyke.codesnap
code --install-extension Atishay-Jain.All-Autocomplete
code --install-extension christian-kohler.npm-intellisense
code --install-extension codezombiech.gitignore
code --install-extension dbaeumer.vscode-eslint
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension file-icons.file-icons
code --install-extension GitHub.copilot
code --install-extension GraphQL.vscode-graphql
code --install-extension GraphQL.vscode-graphql-syntax
code --install-extension IBM.output-colorizer
code --install-extension ms-azuretools.vscode-docker
code --install-extension oderwat.indent-rainbow
code --install-extension usernamehw.errorlens
