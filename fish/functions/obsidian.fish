function obsidian
    set -lx OBSIDIAN_USE_WAYLAND 1
    command obsidian -enable-features=UseOzonePlatform -ozone-platform=wayland $argv
end

