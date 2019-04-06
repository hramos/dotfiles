#!/usr/bin/env bash

echo "Setting up VSCode"

BASE_DIR="$HOME/Library/Application\ Support/Code"
CONFIG_DIR="$BASE_DIR/User"
CONFIG_PATHS=(
  "settings.json"
  "keybindings.json"
  "snippets/"
)

# Remove existing configuration and create symbolic links to configuration files
for CONFIG_PATH in ${CONFIG_PATHS[@]}; do
  rm "$CONFIG_DIR/$CONFIG_PATH"
  ln -s "$HOME/dotfiles/vscode/$CONFIG_PATH" "$CONFIG_DIR/$CONFIG_PATH"
done
