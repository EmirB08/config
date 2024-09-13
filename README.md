# Backup

Assumes a similar setup aready installed, does not include the necessary installs and dependencies. For more information on a minimal config, see [Josean's dev env files](https://github.com/josean-dev/dev-environment-files).

## Included Configurations

- zsh (.zshrc, .zprofile)
- tmux (.tmux.conf)
- Neovim (.config/nvim)
- Wezterm (.wezterm.lua)
- Yabai (.config/yabai)
- SKHD (.config/skhd)
- Powerlevel10k (p10k.zsh)


### Copying Files

To manage these dotfiles, use the `manage_dotfiles.sh` script:

1. To copy files from your home directory to this repository:
   ```
   ./manage_dotfiles.sh to-repo
   ```

2. To copy files from this repository to your home directory:
   ```
   ./manage_dotfiles.sh to-home
   ```
