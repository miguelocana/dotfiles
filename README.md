# Dotfiles

## Setup

```bash
git clone git@github.com:miguelocana/dotfiles.git ~/data/dotfiles
cd ~/data/dotfiles
./setup.sh
```

Menu options:
1. **Git** - configures user name/email, includes aliases
2. **Fish** - symlinks `fish/` to `~/.config/fish`
3. **Ghostty** - symlinks `ghostty/` to `~/.config/ghostty`
4. **Kanata** - symlinks config + systemd service
5. **Completions** - generates shell completions (uv, bun)
6. **All** - runs all of the above

## Quick Reference

### Fish

```bash
fisher list          # installed plugins
fisher update        # update all plugins
fisher install X     # install plugin
```

- Functions: `fish/functions/`

### Git

```bash
git dog              # pretty log graph (--all --decorate --oneline --graph)
```

Add aliases to `git/aliases`.

### Ghostty

- Config: `ghostty/config`
- Shortcuts: `ghostty/shortcuts.txt`

### Kanata

```bash
systemctl --user enable --now kanata  # start and enable
systemctl --user status kanata        # check status
systemctl --user restart kanata       # restart after config changes
```

- Config: `kanata/kanata.kbd` (Caps Lock → tap Esc / hold Hyper)

### Adding New Configs

1. Create `<app>/` directory
2. Add `setup_<app>()` function to `setup.sh`
3. Add menu option
