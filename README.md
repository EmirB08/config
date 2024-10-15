# Backup

This script assumes a similar setup is already installed. It does not include the necessary installations, dependencies, or plugins for Tmux. For more information on a minimal config, see [Josean's dev env files](https://github.com/josean-dev/dev-environment-files).

## Included Configurations

- zsh (`.zshrc`, `.zprofile`)
- tmux (`.tmux.conf`)
- Neovim (`.config/nvim`)
- Wezterm (`.wezterm.lua`)
- Yabai (`.config/yabai`)
- SKHD (`.config/skhd`)
- Powerlevel10k (`p10k.zsh`)

### Copying Files

To manage these dotfiles, use the `manage_dotfiles.sh` script. First, make the script executable:

```bash
chmod +x manage_dotfiles.sh
```

Then, you can use the following commands:

**Copy all files from your home directory to this repository**:
```bash
./manage_dotfiles.sh to-repo
```

**Copy a specific file from your home directory to this repository** (e.g., `.zshrc`):
```bash
./manage_dotfiles.sh to-repo .zshrc
```

**Copy all files from this repository to your home directory**:
```bash
./manage_dotfiles.sh to-home
```

**Copy a specific file from this repository to your home directory** (e.g., `.zshrc`):
```bash
./manage_dotfiles.sh to-home .zshrc
```

---