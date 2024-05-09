# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="eza --icons"
alias ll="eza -alh --icons"
alias tree="eza -T --icons"
alias grep='grep --color=auto'
alias git='LANG=en_GB git'
alias git='LC_ALL=en_GB git'

PS1='[\u@\h]\$'
set -o vi

bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
eval "$(fzf --bash)"
