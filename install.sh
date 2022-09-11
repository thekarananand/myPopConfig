sudo apt install nala -y 

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update -y

sudo nala remove --purge libreoffice* gnome-weather gnome-calendar gnome-contacts totem geary seahorse -y

sudo nala clean
sudo nala autoremove

sudo nala list --upgradable

sudo nala update && sudo nala upgrade -y

sudo nala install neofetch htop ubuntu-restricted-extras code telegrm-desktop discord gnome-software qbittorrent inkscape vlc  -y

flatpak install com.mattjakeman.ExtensionManager com.github.carlos157oliveira.Calculus -y

mkdir /home/thekarananand/.local/share/gnome-shell/extensions
cd extensions
cp * /home/thekarananand/.local/share/gnome-shell/extensions -r

killall -3 gnome-shell

gnome-shell-extension-tool enable blur-my-shell@aunetx
gnome-shell-extension-tool enable date-menu-formatter@marcinjakubowski.github.com
gnome-shell-extension-tool enable drive-menu@gnome-shell-extensions.gcampax.github.com
gnome-shell-extension-tool enable just-perfection-desktop@just-perfection
gnome-shell-extension-tool enable lockkeys@vaina.lt
gnome-shell-extension-tool enable theme-switcher@fthx
gnome-shell-extension-tool enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-shell-extension-tool enable x11gestures@joseexposito.github.io


neofetch
