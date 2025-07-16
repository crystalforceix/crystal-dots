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
            log 'Unlinking...'
            rm -rf $path
        else
            # Prompt user
            read -l -p "input '$path already exists. unlink it? [Y/n] ' -n" confirm || exit 1

            if test "$confirm" = 'n' -o "$confirm" = 'N'
                log 'Skipping...'
                return 1
            else
                log 'Unlinking...'
                rm -rf $path
            end
        end
    end

    return 0
end


# MaomaoWM
if confirm-overwrite $config/maomao
    log 'Unlinking maomao config...'
    unlink $config/maomao
end

# Rofi
if confirm-overwrite $config/rofi
    log 'Unlinking rofi configs...'
    unlink $config/rofi
end

# Foot
if confirm-overwrite $config/foot
    log 'Unlinking foot config...'
    unlink $config/foot
end

# Fish shell
if confirm-overwrite $config/fish
    log 'Unlinking fish shell config...'
    unlink $config/fish
end

# Posh themes
if confirm-overwrite $config/terminal-posh-themes
    log 'Unlinking posh themes config...'
    unlink $config/terminal-posh-themes
end

# Neovim
if confirm-overwrite $config/nvim
    log 'Unlinking neovim config...'
    unlink $config/nvim
end

# Wlogout
if confirm-overwrite $config/wlogout
    log 'Unlinking wlogout config...'
    unlink $config/wlogout
end

# Lavalauncher
if confirm-overwrite $config/lavalauncher
    log 'Unlinking lavalauncher config...'
    unlink $config/lavalauncher
end

# Swaync
if confirm-overwrite $config/swaync
    log 'Unlinking swaync config...'
    unlink $config/swaync
end

# Waybar
if confirm-overwrite $config/waybar
    log 'Unlinking waybar config...'
    unlink $config/waybar
end

# Fastfetch config
if confirm-overwrite $config/fastfetch
    log 'Unlinking fastfetch config...'
    unlink $config/fastfetch
end

# GTK theme config
if confirm-overwrite ~/.themes
    log 'Unliking GTK themes...'
    unlink ~/.themes
end

# Mouse icon config
if confirm-overwrite ~/.icons
    log 'Unlinking Mouse icons themes...'
    unlink ~/.icons
end
