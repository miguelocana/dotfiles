# AGENTS.md

## Overview
Personal dotfiles for multiple systems (macOS, Linux distros).

## Structure
```
├── git/            # Git config (symlinked via include.path)
│   └── aliases     # Git aliases
├── fish/           # Fish shell (symlink to ~/.config/fish)
├── ghostty/        # Terminal emulator (symlink to ~/.config/ghostty)
├── setup.sh        # Interactive setup script
└── .gitignore
```

## Setup
Run `./setup.sh` and select what to configure:
1. Git - prompts for name/email, includes git/aliases
2. Fish - symlinks to ~/.config/fish
3. Ghostty - symlinks to ~/.config/ghostty
4. All - runs all of the above

Symlinks warn before replacing existing configs.

## Rules
- Never edit `fish_variables` (local state, gitignored)
- Never commit `.gitconfig` (contains personal info)
- Aliases go in `git/aliases`, not `.gitconfig`

## Commits
- Use conventional commits: `feat:`, `fix:`, `chore:`, etc.
- Keep messages minimal, no paragraphs

## Adding New Configs
1. Create `<app>/` folder in repo
2. Add `setup_<app>()` function to setup.sh
3. Add to menu options in setup.sh
4. Add sensitive files to .gitignore
5. Optionally add `shortcuts.txt` for keybindings reference
