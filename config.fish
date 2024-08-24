if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting ""
    fastfetch --logo arch_small
end
set -gx PATH $HOME/.local/bin $PATH
alias flames='flameshot gui'
set -x PF_INFO "ascii title os host kernel uptime memory pallete"
