#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"
OBSIDIAN_DIR="$HOME/Documents/Obsidian Vault/Programming"
MARKDOWN_DIR="$DOTFILES_DIR/markdown"

files=(".zshrc" ".wezterm.lua" ".tmux.conf" ".p10k.zsh" ".zprofile")
folders=(".tmux")
config_folders=("nvim" "skhd" "yabai")
markdown_files=("yabai nvim tmux.md")

copy_to_repo() {
  local changes_detected=false

  for file in "${files[@]}"; do
    if [[ "$HOME/$file" -nt "$DOTFILES_DIR/$file" ]]; then
      cp "$HOME/$file" "$DOTFILES_DIR/"
      echo "Updated: $file"
      changes_detected=true
    fi
  done

  for folder in "${folders[@]}"; do
    if output=$(rsync -ai --checksum --exclude='plugins/*' "$HOME/$folder/" "$DOTFILES_DIR/$folder/" 2>/dev/null); then
      if [[ -n "$output" ]]; then
        echo "Changes in $folder:"
        echo "$output" | awk '{print "  - " $NF}'
        changes_detected=true
      fi
    fi
  done

  for folder in "${config_folders[@]}"; do
    if output=$(rsync -ai --checksum "$CONFIG_DIR/$folder/" "$DOTFILES_DIR/.config/$folder/" 2>/dev/null); then
      if [[ -n "$output" ]]; then
        echo "Changes in $folder:"
        echo "$output" | awk '{print "  - " $NF}'
        changes_detected=true
      fi
    fi
  done

  for md_file in "${markdown_files[@]}"; do
    mkdir -p "$MARKDOWN_DIR"
    if [[ "$OBSIDIAN_DIR/$md_file" -nt "$MARKDOWN_DIR/$md_file" ]]; then
      cp "$OBSIDIAN_DIR/$md_file" "$MARKDOWN_DIR/$md_file"
      echo "Updated: $md_file"
      changes_detected=true
    fi
  done

  echo "Sync Complete - repo"
  if [[ "$changes_detected" = false ]]; then
    echo "No changes detected."
  fi
}

copy_to_home() {
  local changes_detected=false

  for file in "${files[@]}"; do
    if [[ "$DOTFILES_DIR/$file" -nt "$HOME/$file" ]]; then
      cp "$DOTFILES_DIR/$file" "$HOME/"
      echo "Updated: $file"
      changes_detected=true
    fi
  done

  for folder in "${folders[@]}"; do
    if output=$(rsync -ai --checksum --exclude='plugins/*' "$DOTFILES_DIR/$folder/" "$HOME/$folder/" 2>/dev/null); then
      if [[ -n "$output" ]]; then
        echo "Changes in $folder:"
        echo "$output" | awk '{print "  - " $NF}'
        changes_detected=true
      fi
    fi
  done

  for folder in "${config_folders[@]}"; do
    if output=$(rsync -ai --checksum "$DOTFILES_DIR/.config/$folder/" "$CONFIG_DIR/$folder/" 2>/dev/null); then
      if [[ -n "$output" ]]; then
        echo "Changes in $folder:"
        echo "$output" | awk '{print "  - " $NF}'
        changes_detected=true
      fi
    fi
  done

  for md_file in "${markdown_files[@]}"; do
    mkdir -p "$OBSIDIAN_DIR"
    if [[ "$MARKDOWN_DIR/$md_file" -nt "$OBSIDIAN_DIR/$md_file" ]]; then
      cp "$MARKDOWN_DIR/$md_file" "$OBSIDIAN_DIR/$md_file"
      echo "Updated: $md_file"
      changes_detected=true
    fi
  done

  echo "Sync complete - home"
  if [[ "$changes_detected" = false ]]; then
    echo "No changes detected."
  fi
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
