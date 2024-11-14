if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U EDITOR nvim

alias c='clear && cd'
alias ls='eza --icons'
alias cls='clear'

starship init fish | source
starship preset bracketed-segments -o ~/.config/starship.toml
