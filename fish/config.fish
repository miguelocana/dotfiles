if status is-interactive
    set -g fish_greeting
end
export PATH="$HOME/.local/bin:$HOME/.bun/bin:$PATH"

if test -f "$HOME/.config/fish/config.local.fish"
    source "$HOME/.config/fish/config.local.fish"
end
