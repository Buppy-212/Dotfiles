# Replace ls with eza
alias ls="eza --icons"
alias ll="eza -alh --icons"
alias tree="eza -T --icons"

# Grep colours
alias grep='grep --color=auto'

# Auto completions with tab and shift-tab
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'
bind 'set show-all-if-ambiguous on'

# Interactive zoxide on Control-f
bind '"\C-f":"cdi\n"'

# F-keys to launch common programs 
bind '"\eOP":"nvim\n"'
bind '"\eOQ":"yazi\n"'
bind '"\eOR":"btop\n"'

# Shell integrations
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
eval "$(fzf --bash)"
