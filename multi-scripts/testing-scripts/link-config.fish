#!/usr/bin/env fish


# Variables
set -q _flag_noconfirm && set noconfirm '--noconfirm'
set -q XDG_CONFIG_HOME && set -l config $XDG_CONFIG_HOME || set -l config $HOME/.config
set -q XDG_STATE_HOME && set -l state $XDG_STATE_HOME || set -l state $HOME/.local/state

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

# Comfirm Function
function confirm-overwrite -a path
    if test -e $path -o -L $path
        # No prompt if noconfirm
        if set -q noconfirm
            input "$path already exists. Overwrite? [Y/n]"
            log 'Removing...'
            rm -rf $path
        else
            # Prompt user
            read -l -p "input '$path already exists. Overwrite? [Y/n] ' -n" confirm || exit 1

            if test "$confirm" = 'n' -o "$confirm" = 'N'
                log 'Skipping...'
                return 1
            else
                log 'Removing...'
                rm -rf $path
            end
        end
    end

    return 0
end

# Install yay if not already installed
if ! pacman -Q yay &> /dev/null
    log 'Yay not installed. Installing...'

    # Install
    sudo pacman -S --needed git base-devel $noconfirm
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay

    # Setup
    yay -Y --gendb
    yay -Y --devel --save
end

# Install crystal-clients package in aur-packages-stored folder.
log 'Installing crystal-clients package in aur-packages-stored folder...'
yay -Bi ./../../aur-packages-stored/crystal-clients $noconfirm

# Install crystal-themes-fonts package in aur-packages-stored folder.
log 'Installing crystal-themes-fonts package in aur-packages-stored folder...'
yay -Bi ./../../aur-packages-stored/crystal-themes-fonts/ $noconfirm

# Niri
if confirm-overwrite $config/niri
    log 'Installing niri configs...'
    ln -s ./../crystal-dots/.config/niri $config/niri
end

# Quickshell
if confirm-overwrite $config/quickshell
    log 'Installing quickshell configs...'
    ln -s ./../crystal-dots/.config/quickshell $config/quickshell
end

# Kitty
if confirm-overwrite $config/kitty
    log 'Installing kitty config...'
    ln -s ./../crystal-dots/.config/kitty $config/kitty
end

# Fish shell
if confirm-overwrite $config/fish
    log 'Installing fish shell config...'
    ln -s ./../crystal-dots/.config/fish $config/fish
end

# Posh themes
if confirm-overwrite $config/terminal-posh-themes
    log 'Installing posh themes config...'
    ln -s ./../crystal-dots/.config/terminal-posh-themes $config/terminal-posh-themes
end
