#!/usr/bin/env fish

# Helper funcs
function _out -a colour text
    set_color $colour
    # Pass arguments other than text to echo
    echo $argv[3..] -- ":: $text"
    set_color normal
end

function log -a text
    _out cyan $text $argv[2..]
end

function input -a text
    _out blue $text $argv[2..]
end

# Unlink crystal-dots folder
log 'Unlinking crystal-dots configs'
cd ~/crystal-dots/multi-scripts/testing-scripts/ && ./unlink-config.fish

# Remove dependacy packages of dotfiles
log 'Removing dependacy packages of crystal-dots'
sudo pacman -Rns wlr-dpms-git fastfetch maomaowm-git nwg-look rofi-wayland foot xdg-desktop-portal-wlr swaybg waybar wl-clip-persist cliphist wl-clipboard wlsunset xfce-polkit swaync pamixer lavalauncher-mao-git sway-audio-idle-inhibit-git swayidle dimland-git brightnessctl swayosd wlr-randr grim slurp satty swaylock-effects-git wlogout crystal-themes-fonts crystal-neovim

# Remove crystal-dots folder
log 'Removing crystal-dots folder'
cd ~ && rm -rf crystal-dots/

log 'Done! here you go baby'
