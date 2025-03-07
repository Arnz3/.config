if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U EDITOR nvim

alias c='clear && cd'
alias ls='eza --icons'
alias cls='clear'

# bash !! and !$ keybinds

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end


starship init fish | source
starship preset bracketed-segments -o ~/.config/starship.toml

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
