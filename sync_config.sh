#!/bin/bash

CONFIG_REPO="$HOME/config"
CONFIG_DIR="$HOME/.config"
OBSIDIAN_DIR="$HOME/Documents/Obsidian Vault/Programming"
MARKDOWN_DIR="$CONFIG_REPO/markdown"

files=(".zshrc" ".wezterm.lua" ".tmux.conf" ".p10k.zsh" ".zprofile")
config_folders=("nvim" "skhd" "yabai")
markdown_files=("yabai nvim tmux.md")

copy_to_repo() {
  local changes_detected=false

  for file in "${files[@]}"; do
    if [[ "$HOME/$file" -nt "$CONFIG_REPO/$file" ]]; then
      cp "$HOME/$file" "$CONFIG_REPO/"
      echo "Updated: $file"
      changes_detected=true
    fi
  done

  for folder in "${folders[@]}"; do
    if output=$(rsync -ai --checksum --exclude='plugins/*' "$HOME/$folder/" "$CONFIG_REPO/$folder/" 2>/dev/null); then
      if [[ -n "$output" ]]; then
        echo "Changes in $folder:"
        echo "$output" | awk '{print "  - " $NF}'
        changes_detected=true
      fi
    fi
  done

  for folder in "${config_folders[@]}"; do
    if output=$(rsync -ai --checksum "$CONFIG_DIR/$folder/" "$CONFIG_REPO/.config/$folder/" 2>/dev/null); then
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

  mkdir -p "$CONFIG_REPO/.tmux/plugins"
  touch "$CONFIG_REPO/.tmux/plugins/.gitkeep"

  echo "Sync - repo."
  if [[ "$changes_detected" = false ]]; then
    echo "No changes detected."
  fi
}

copy_to_home() {
  local changes_detected=false

  for file in "${files[@]}"; do
    if [[ "$CONFIG_REPO/$file" -nt "$HOME/$file" ]]; then
      cp "$CONFIG_REPO/$file" "$HOME/"
      echo "Updated: $file"
      changes_detected=true
    fi
  done

  for folder in "${folders[@]}"; do
    if output=$(rsync -ai --checksum --exclude='plugins/*' "$CONFIG_REPO/$folder/" "$HOME/$folder/" 2>/dev/null); then
      if [[ -n "$output" ]]; then
        echo "Changes in $folder:"
        echo "$output" | awk '{print "  - " $NF}'
        changes_detected=true
      fi
    fi
  done

  for folder in "${config_folders[@]}"; do
    if output=$(rsync -ai --checksum "$CONFIG_REPO/.config/$folder/" "$CONFIG_DIR/$folder/" 2>/dev/null); then
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

  echo "Sync - home."
  if [[ "$changes_detected" = false ]]; then
    echo "No changes detected."
  fi
}

case "$1" in
  "repo")
    copy_to_repo
    ;;
  "home")
    copy_to_home
    ;;
  *)
    echo "Usage: $0 {repo|home}"
    exit 1
    ;;
esac
