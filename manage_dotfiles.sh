#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

files=(".zshrc" ".wezterm.lua" ".tmux.conf" ".p10k.zsh" ".zprofile")
folders=(".tmux")
config_folders=("nvim" "skhd" "yabai")

copy_to_repo() {
  if [ -n "$2" ]; then
    # Copy the single specified file
    if [[ " ${files[@]} " =~ " $2 " ]]; then
      cp "$HOME/$2" "$DOTFILES_DIR/"
      echo "Copied $2 to repository"
    else
      echo "File $2 not found in the list of tracked files"
    fi
  else
    # Copy all files
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

    echo "Copied all dotfiles to repository"
  fi
}

copy_to_home() {
  if [ -n "$2" ]; then
    # Copy the single specified file
    if [[ " ${files[@]} " =~ " $2 " ]]; then
      cp "$DOTFILES_DIR/$2" "$HOME/"
      echo "Copied $2 to home directory"
    else
      echo "File $2 not found in the list of tracked files"
    fi
  else
    # Copy all files
    for file in "${files[@]}"; do
      cp "$DOTFILES_DIR/$file" "$HOME/"
    done

    for folder in "${folders[@]}"; do
      rsync -av --exclude='plugins/*' "$DOTFILES_DIR/$folder/" "$HOME/$folder/"
    done

    for folder in "${config_folders[@]}"; do
      rsync -av "$DOTFILES_DIR/.config/$folder/" "$CONFIG_DIR/$folder/"
    done

    echo "Copied all dotfiles to home directory"
  fi
}

case "$1" in
  "to-repo")
    copy_to_repo "$@"
    ;;
  "to-home")
    copy_to_home "$@"
    ;;
  *)
    echo "Usage: $0 {to-repo|to-home} [filename]"
    exit 1
    ;;
esac
