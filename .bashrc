# Add local bin to path

export PATH="$HOME/.local/bin/:$PATH"

# Replace ls with eza
alias ls="eza --icons --group-directories-first"
alias ll="eza -alh --icons --group-directories-first"
alias tree="eza -T --icons"

# Grep colours
alias grep='grep --color=auto'

# Auto completions with tab and shift-tab
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'
bind 'set show-all-if-ambiguous on'

# Interactive zoxide on Control-f
bind '"\C-f":"cdi\n"'

# Nvim fzf
bind '"\C-v":"nvim **\t"'

# F-keys to launch common programs 
bind '"\eOP":"nvim\n"'
bind '"\eOQ":"yazi\n"'
bind '"\eOR":"btop\n"'
bind '"\eOS":"tmux a || tmux\n"'

# Fzf colorscheme
. "$HOME"/.config/fzf/theme.sh

# Shell integrations
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
eval "$(fzf --bash)"
