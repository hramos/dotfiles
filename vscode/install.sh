#!/bin/sh
# Setup a machine for VSCode
# Place VSCode User configuration files in vscode/User, which will be symlinked to the VSCode user dir.

set -x

if test ! "$(uname)" = "Darwin"
  then
  exit 0
fi

function install_user_dir_symlink {
  local vscode_dir=$1
  mv "$vscode_dir/User" "$vscode_dir/User.bku"
  ln -s "$PWD/User" "$vscode_dir/User"
}

function install_extensions {
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
}

function configure_user_dir {
  local vscode_dir=$1

  if [[ -L "$vscode_dir/User" ]]; then
    action=
    skip=
    install=
    overwrite=

    echo "VS Code User dir symlink already exists in $vscode_dir. VS Code may already be configured. What do you want to do?\n\
          [s]kip, [i]nstall extensions, [o]verwrite user?"
    read -n 1 action

    case "$action" in
      o )
        overwrite=true;;
      i )
        install=true;;
      s )
        skip=true;;
      * )
        ;;
    esac

    if [ "$overwrite" == "true" ]
    then
      install_user_dir_symlink $vscode_dir
    fi

    if [ "$install" == "true" ]
    then
      install_extensions
    fi

    if [ "$skip" == "true" ]
    then
      echo "skipped"
    fi
  fi
}

# Some of my machines use a custom VS Code install, in which
# case the VSCODE_DIR envvar will be set.
vscode_dir=${VSCODE_DIR:-~/Library/Application\ Support/Code}
if [[ ! -d $VSCODE_DIR ]]; then
  echo "Could not locate Visual Studio Code at $VSCODE_DIR"
  echo "Reminder: you may set the VSCODE_DIR envvar if you happen to have a fork of VSCode installed elsewhere..."
  exit 1
fi
configure_user_dir $vscode_dir

if test ! $(which code)
then
  echo "  Install 'code' command in PATH by launching VS Code, then typing `shell command` into the Command Palette (Cmd+Shift+P)."
fi
