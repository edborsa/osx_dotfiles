# My Dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

Install GNU Stow:

```bash
# macOS
brew install stow

# Ubuntu/Debian
sudo apt install stow

# Arch Linux
sudo pacman -S stow

# CentOS/RHEL/Fedora
sudo dnf install stow
```

## Quick Setup

1. **Clone this repository:**

   ```bash
   git clone <your-repo-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. **Install all configurations:**

   ```bash
   stow */
   ```

3. **Or install selectively:**
   ```bash
   stow vim bash git tmux
   ```

## Available Packages

| Package | Description              | Files                             |
| ------- | ------------------------ | --------------------------------- |
| `bash`  | Bash shell configuration | `.bashrc`, `.bash_profile`        |
| `git`   | Git configuration        | `.gitconfig`, `.gitignore_global` |
| `vim`   | Vim editor configuration | `.vimrc`, `.vim/`                 |
| `tmux`  | Terminal multiplexer     | `.tmux.conf`                      |
| `zsh`   | Zsh shell configuration  | `.zshrc`, `.zsh/`                 |

## Usage

### Installing Packages

```bash
# Install a single package
stow vim

# Install multiple packages
stow bash git vim tmux

# Install all packages
stow */
```

### Removing Packages

```bash
# Remove a single package
stow -D vim

# Remove multiple packages
stow -D bash git vim tmux
```

### Updating Packages

```bash
# Restow (useful after pulling updates)
stow -R vim

# Or remove and reinstall
stow -D vim && stow vim
```

### Dry Run

Test what Stow will do without making changes:

```bash
stow -n vim  # Shows what would be linked
stow -nD vim # Shows what would be removed
```

## Directory Structure

```
dotfiles/
├── README.md
├── bash/
│   ├── .bashrc
│   └── .bash_profile
├── git/
│   ├── .gitconfig
│   └── .gitignore_global
├── vim/
│   ├── .vimrc
│   └── .vim/
│       └── colors/
├── tmux/
│   └── .tmux.conf
└── zsh/
    ├── .zshrc
    └── .zsh/
        └── aliases
```

## Tips

- **Backup existing configs** before running Stow (it will warn about conflicts)
- **Use `-v` flag** for verbose output: `stow -v vim`
- **Target specific directory** with `-t`: `stow -t ~/config vim`
- **Check for broken symlinks** periodically with: `find ~ -xtype l`

## Troubleshooting

### Conflict Errors

If Stow reports conflicts:

1. **Backup existing files:**

   ```bash
   mv ~/.vimrc ~/.vimrc.backup
   ```

2. **Then stow the package:**
   ```bash
   stow vim
   ```

### Broken Symlinks

Remove broken symlinks and restow:

```bash
find ~ -xtype l -delete  # Be careful with this!
stow -R vim
```

### Checking What's Stowed

See what Stow has linked:

```bash
ls -la ~ | grep "\->"  # Shows all symlinks in home directory
```

## Contributing

When adding new configurations:

1. Create a new package directory
2. Add config files maintaining the target directory structure
3. Update this README's package table
4. Test with `stow -n package-name` before committing

## Notes

- Stow works by creating symlinks from the target directory (usually `~`) back to the stow directory
- The package directory name doesn't affect the linking - only the files inside matter
- Always run Stow commands from the dotfiles directory
- Use git to version control and sync across machines
