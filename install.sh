#!/usr/bin/env bash
echo "Running install script..."
PACMAN_PKGS=(
	# Audio ---------------------------------------------------------------
	"pipewire"
	"pipewire-audio"
	"pipewire-pulse"
	"pipewire-alsa"
	"pavucontrol"
	"pamixer"
	# Bluetooth -----------------------------------------------------------
	"bluez"
	"bluez-utils"
	"blueman"
	# Network -------------------------------------------------------------
	"network-manager-applet"
	# Command line utilities ----------------------------------------------
	"lazygit"
	"go"
	"python"
	"rustup"
	"sbctl"
	"starship"
	"zoxide"
	"fzf"
	"entr"
	"eza"
	"yazi"
	"unar"
	"ffmpegthumbnailer"
	"jq"
	"poppler"
	"fd"
	"ripgrep"
	"btop"
	"fastfetch"
	"neovim"
	"stow"
	"github-cli"
	"tmux"
	"ufw"
	# Fonts ---------------------------------------------------------------
	"ttf-jetbrains-mono-nerd"
	"noto-fonts"
	"noto-fonts-cjk"
	"noto-fonts-emoji"
	"noto-fonts-extra"
	# Desktop Environment -------------------------------------------------
	"xdg-user-dirs"
	"hyprland"
	"hyprlock"
	"hyprpaper"
	"waybar"
	"mako"
	"wofi"
	"brightnessctl"
	"kitty"
	"swappy"
	"grim"
	"slurp"
	"sddm"
	# Applications --------------------------------------------------------
	"zathura"
	"mpv"
	"mpv-mpris"
	"firefox"
	"thunderbird"
	"engrampa"
	"thunar"
	"thunar-archive-plugin"
	"thunar-volman"
	"tumbler"
	# Printing ------------------------------------------------------------
	"cups"
)
AUR_PKGS=(
	"wlogout-bin"
	"nwg-look-bin"
	"hyprshade"
)

SERVICES=(
	"bluetooth"
	"sddm"
	"cups"
)

echo "Installing yay..."
cd "$HOME" || exit
git clone https://aur.archlinux.org/yay.git
cd "$HOME"/yay || exit
makepkg -si

for PKG in "${PACMAN_PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	sudo pacman -S "$PKG"
done

for PKG in "${AUR_PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	yay -S "$PKG"
done

echo "Set up xdg user directories"
cd "$HOME" || exit
xdg-user-dirs-update

echo "Installing dotfiles..."
cd "$HOME"/Dotfiles || exit
stow . -D install.sh

echo "Enabling startup programs"
for SERVICE in "${SERVICES[@]}"; do
	echo "ENABLING: ${SERVICE}"
	sudo systemctl enable "$SERVICE"
done
