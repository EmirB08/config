#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"
OBSIDIAN_DIR="$HOME/Documents/Obsidian Vault/Programming"
MARKDOWN_DIR="$DOTFILES_DIR/markdown"

files=(".zshrc" ".wezterm.lua" ".tmux.conf" "p10k.zsh" ".zprofile")
folders=(".tmux")
config_folders=("nvim" "skhd" "yabai")
markdown_files=("yabai nvim tmux.md")

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

  for md_file in "${markdown_files[@]}"; do
    # Create the markdown directory in the dotfiles repo
    mkdir -p "$MARKDOWN_DIR"
    # Copy the Markdown file to the markdown directory in the dotfiles repo
    cp "$OBSIDIAN_DIR/$md_file" "$MARKDOWN_DIR/$md_file"
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

  for md_file in "${markdown_files[@]}"; do
    # Create the Obsidian directory in the home directory
    mkdir -p "$OBSIDIAN_DIR"
    # Copy the Markdown file from the markdown directory in the dotfiles repo to the Obsidian directory in the home directory
    cp "$MARKDOWN_DIR/$md_file" "$OBSIDIAN_DIR/$md_file"
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
