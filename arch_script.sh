#!/bin/bash

# Update system
sudo pacman -Syu --noconfirm

# Install yay
sudo pacman -S --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Install Fish and set up Oh My Fish (OMF)
sudo pacman -S --noconfirm fish
chsh -s /usr/bin/fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Install fonts
sudo pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji

# Install packages using yay and pacman
yay -S --noconfirm brave-bin visual-studio-code-bin prismlauncher-qt5-bin ani-cli
sudo pacman -S --noconfirm libreoffice-still discord mpv spotify-launcher p7zip qbittorrent eog evince jre22-openjdk fastfetch

# Final message
echo "Setup complete!"
