#!/usr/bin/env fish

# Unlink crystal-dots folder
log 'Unlinking crystal-dots configs'
cd ~/crystal-dots/multi-scripts/testing-scripts/ && ./unlink-config.fish

# Remove dependacy packages of dotfiles
log 'Removing dependacy packages of crystal-dots'
sudo pacman -Rns maomaowm-git nwg-look rofi-wayland foot xdg-desktop-portal-wlr swaybg waybar wl-clip-persist cliphist wl-clipboard wlsunset xfce-polkit swaync pamixer lavalauncher-mao-git sway-audio-idle-inhibit-git swayidle dimland-git brightnessctl swayosd wlr-randr grim slurp satty swaylock-effects-git wlogout crystal-themes-fonts crystal-neovim

# Remove crystal-dots folder
log 'Removing crystal-dots folder'
cd ~ && rm -rf crystal-dots/

log 'Done! here you go baby'
