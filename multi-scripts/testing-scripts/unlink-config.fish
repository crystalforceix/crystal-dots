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
            input "$path already exists. Do you want unlink it? [Y/n]"
            unlink $path
        else
            # Prompt user
            read -l -p "input '$path already exists. unlink it? [Y/n] ' -n" confirm || exit 1

            if test "$confirm" = 'n' -o "$confirm" = 'N'
                log 'Skipping...'
                return 1
            else
                unlink $path
            end
        end
    end

    return 0
end


# MaomaoWM
if confirm-overwrite $config/maomao
    log 'Unlinking maomao config...'
end

# Rofi
if confirm-overwrite $config/rofi
    log 'Unlinking rofi configs...'
end

# Foot
if confirm-overwrite $config/foot
    log 'Unlinking foot config...'
end

# Fish shell
if confirm-overwrite $config/fish
    log 'Unlinking fish shell config...'
end

# Posh themes
if confirm-overwrite $config/terminal-posh-themes
    log 'Unlinking posh themes config...'
end

# Neovim
if confirm-overwrite $config/nvim
    log 'Unlinking neovim config...'
end

# Wlogout
if confirm-overwrite $config/wlogout
    log 'Unlinking wlogout config...'
end

# Lavalauncher
if confirm-overwrite $config/lavalauncher
    log 'Unlinking lavalauncher config...'
end

# Swaync
if confirm-overwrite $config/swaync
    log 'Unlinking swaync config...'
end

# Waybar
if confirm-overwrite $config/waybar
    log 'Unlinking waybar config...'
end

# Fastfetch config
if confirm-overwrite $config/fastfetch
    log 'Unlinking fastfetch config...'
end

# GTK theme config
if confirm-overwrite ~/.themes
    log 'Unliking GTK themes...'
end

# Mouse icon config
if confirm-overwrite ~/.icons
    log 'Unlinking Mouse icons themes...'
end
