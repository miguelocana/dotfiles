#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link_config() {
    local src="$1"
    local dest="$2"
    local name="$3"

    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "$name: already linked ✓"
        return
    fi

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        read -p "$name: $dest exists. Replace? [y/N] " confirm
        [[ "$confirm" != [yY] ]] && echo "Skipped." && return
        rm -rf "$dest"
    fi

    ln -s "$src" "$dest"
    echo "$name: linked!"
}

setup_git() {
    read -p "Git name: " git_name
    read -p "Git email: " git_email
    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
    git config --global include.path "$DOTFILES_DIR/git/aliases"
    echo "Git configured!"
}

setup_fish() {
    link_config "$DOTFILES_DIR/fish" "$HOME/.config/fish" "Fish"
}

setup_ghostty() {
    link_config "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty" "Ghostty"
}

setup_completions() {
    command -v uv >/dev/null && uv generate-shell-completion fish > "$DOTFILES_DIR/fish/completions/uv.fish" && echo "uv: generated!"
    command -v bun >/dev/null && bun completions > "$DOTFILES_DIR/fish/completions/bun.fish" && echo "bun: generated!"
}

echo "What to set up?"
echo "1) Git"
echo "2) Fish"
echo "3) Ghostty"
echo "4) Completions"
echo "5) All"
read -p "Choice [1-5]: " choice

case $choice in
    1) setup_git ;;
    2) setup_fish ;;
    3) setup_ghostty ;;
    4) setup_completions ;;
    5) setup_git; setup_fish; setup_ghostty; setup_completions ;;
    *) echo "Invalid choice" ;;
esac
