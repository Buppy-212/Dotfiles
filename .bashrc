# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias git='LANG=en_GB git'
alias git='LC_ALL=en_GB git'
PS1='[\u@\h]\$'

eval "$(starship init bash)"
eval "$(zoxide init bash)"
