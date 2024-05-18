# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h]\$'
# Replace ls with eza
alias ls="eza --icons"
alias ll="eza -alh --icons"
alias tree="eza -T --icons"
alias e="yazi"

# Grep colours
alias grep='grep --color=auto'

# vi mode keybindings
set -o vi

# Keep ctrl-l to clear with vi mode
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
bind 'set show-all-if-ambiguous on'

# Auto completions with tab and shift-tab
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'

# Shell integrations
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
eval "$(fzf --bash)"
