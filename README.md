# config

- zsh (`.zshrc`, `.zprofile`)
- tmux (`.tmux.conf`)
- neovim (`.config/nvim`)
- wezterm (`.wezterm.lua`)
- yabai (`.config/yabai`)
- skhd (`.config/skhd`)
- powerlevel10k (`p10k.zsh`)

### sync

```bash
chmod +x sync_config.sh
```

**Copy all files from home to repo**:
```bash
./sync_config.sh repo
```

**Copy a specific file from home to repo**:
```bash
./sync_config.sh repo .zshrc
```

**Copy all files from repo to home**:
```bash
./sync_config.sh home
```

**Copy a specific file from repo to home**:
```bash
./sync_config.sh home .zshrc
```

---