fish_config theme choose "color"
oh-my-posh init fish --config $HOME/crystal-dots/.config/terminal-posh-themes/themes1.omp.json | source
if status is-interactive
    set fish_greeting
end

