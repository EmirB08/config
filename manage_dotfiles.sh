#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

files=(".zshrc" ".wezterm.lua" ".tmux.conf" ".p10k.zsh" ".zprofile")
folders=(".tmux")
config_folders=("nvim" "skhd" "yabai")

copy_to_repo() {
  for file in "${files[@]}"; do
    cp "$HOME/$file" "$DOTFILES_DIR/"
  done

  for folder in "${folders[@]}"; do
    rsync -av --exclude='plugins/*' "$HOME/$folder/" "$DOTFILES_DIR/$folder/"
  done

  for folder in "${config_folders[@]}"; do
    rsync -av "$CONFIG_DIR/$folder/" "$DOTFILES_DIR/.config/$folder/"
  done

  # Ensure the plugins folder exists but is empty
  mkdir -p "$DOTFILES_DIR/.tmux/plugins"
  touch "$DOTFILES_DIR/.tmux/plugins/.gitkeep"

  echo "Copied dotfiles to repository"
}

copy_to_home() {
  for file in "${files[@]}"; do
    cp "$DOTFILES_DIR/$file" "$HOME/"
  done

  for folder in "${folders[@]}"; do
    rsync -av --exclude='plugins/*' "$DOTFILES_DIR/$folder/" "$HOME/$folder/"
  done

  for folder in "${config_folders[@]}"; do
    rsync -av "$DOTFILES_DIR/.config/$folder/" "$CONFIG_DIR/$folder/"
  done

  echo "Copied dotfiles to home directory"
}

case "$1" in
  "to-repo")
    copy_to_repo
    ;;
  "to-home")
    copy_to_home
    ;;
  *)
    echo "Usage: $0 {to-repo|to-home}"
    exit 1
    ;;
esac