# My Dotfiles

![Desktop with eww bar](Screenshots/Desktop.png)
![Desktop with rofi,swaync and nvim open](Screenshots/Desktop-rofi.png)

## List of programs

### Hyprland Desktop Environment

- Eww (AUR)
- Ghostty
- Grim (for printscreen)
- Hypridle
- Hyprland
- Hyprlock
- Hyprpaper
- Rbw (rofi bitwarden)
- Rofi-emoji
- Rofi-wayland
- Slurp (for printscreen)
- Swappy
- Swaync
- Uwsm

### Greeter

- Nwg-hello (requires greetd)

### Terminal Programs

- Bluetui
- Btop
- Dash
- Eza
- Fastfetch
- Fzf
- Jq
- Latexindent
- Mpv
- Neovim
- Networkmanger
- Playerctl
- Python
- Tmux
- Yazi
- Zoxide
- Zsh

### Other Programs

- Zathura

## Installation

Ensure you have the following installed on your system

### Git

```Bash
sudo pacman -S git
```

### Stow

```Bash
sudo pacman -S stow
```

Then run the following commands from the home directory

```Bash
git clone https://github.com/Buppy-212/Dotfiles.git
cd Dotfiles
stow .
```
