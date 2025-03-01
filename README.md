# My Dotfiles

![Desktop with eww bar](./Screenshots/Desktop.png)

![Desktop with rofi,swaync and nvim open](./Screenshots/Desktop-rofi.png)

## List of programs

### Hyprland Desktop Environment

```Bash
sudo pacman -S hyprland hyprlock hyprpaper hyprpolkit rofi-wayland uwsm kitty nwg-hello
sudo pacman -S grim slurp swappy
```

### Music/Swaync

```Bash
sudo pacman -S swaync mpd mcmpcpp playerctl mpd-mpris
systemctl --user enable mpd
systemctl --user enable mpd-mpris
```

### Eww

```Bash
yay -S eww
sudo pacman -S bluetui pulsemixer hypridle networkmanger btop hyprsunset
sudo pacman -S dash python jq
systemctl --user enable update-check.service
```

### Terminal programs

```bash
sudo pacman -S neovim fzf eza fastfetch tmux yazi zoxide zsh lazygit
```

### Extras

```Bash
sudo pacman -S rbw zathura mpv
```

Latexindent can be installed via mason.nvim

## Installation

Ensure you have the following installed on your system

```Bash
sudo pacman -S git stow
```

Then run the following commands from the home directory

```Bash
git clone https://github.com/Buppy-212/Dotfiles.git
cd Dotfiles
stow --dotfiles .
```
