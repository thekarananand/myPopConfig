sudo date >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Installing nala"

echo "[COMMAND] : sudo apt-get install nala -y" >> logs
echo "" >> logs
sudo apt-get install nala -y >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Setting Up Microsoft's Repo for VS CODE"

echo "[COMMAND] : wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg" >> logs
echo "" >> logs
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg >> logs

echo "[COMMAND] : sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg" >> logs
echo "" >> logs
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg >> logs

echo "[COMMAND] : sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' ">> logs
echo "" >> logs
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

echo "[COMMAND] : rm -f packages.microsoft.gpg" >> logs
echo "" >> logs
rm -f packages.microsoft.gpg
echo "---------------------------------------------------------------------------------------" >> logs

echo "Setting Up Flathub"

echo "[COMMAND] : flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo " >> logs
echo "" >> logs
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Updating Flatpak"

echo "[COMMAND] : flatpak update -y " >> logs
echo "" >> logs
flatpak update -y >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Removing Unnecessary .deb Packages"

echo "[COMMAND] : " >> logs
echo "" >> logs
sudo nala remove --purge libreoffice* gnome-weather gnome-calendar gnome-contacts totem geary seahorse -y >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Cleaning Up"

echo "[COMMAND] : nala clean" >> logs
echo "" >> logs
sudo nala clean >> logs

echo "[COMMAND] : nala autoremove " >> logs
echo "" >> logs
sudo nala autoremove >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Updating .deb Packages"

echo "[COMMAND] : sudo nala update && sudo nala upgrade -y" >> logs
echo "" >> logs
sudo nala update && sudo nala upgrade -y >> logs

echo "[COMMAND] : nala list --upgradable" >> logs
echo "" >> logs
nala list --upgradable >> logs

echo "[COMMAND] : sudo nala update && sudo nala upgrade -y" >> logs
echo "" >> logs
sudo nala update && sudo nala upgrade -y >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Installing Apps"
echo "[COMMAND] : sudo nala install neofetch htop ubuntu-restricted-extras code telegrm-desktop discord gnome-software qbittorrent inkscape vlc  -y >> logs" >> logs
echo "" >> logs
sudo nala install neofetch htop ubuntu-restricted-extras code telegrm-desktop discord gnome-software qbittorrent inkscape vlc  -y >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Install Flatpak Apps"
echo "[COMMAND] : flatpak install com.mattjakeman.ExtensionManager com.github.carlos157oliveira.Calculus -y" >> logs
echo "" >> logs
flatpak install com.mattjakeman.ExtensionManager com.github.carlos157oliveira.Calculus -y >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Installing Extenstions"

echo "[COMMAND] : mkdir /home/thekarananand/.local/share/gnome-shell/extensions" >> logs
echo "[COMMAND] : cd extensions" >> logs
echo "[COMMAND] : cp * /home/thekarananand/.local/share/gnome-shell/extensions -r" >> logs

mkdir /home/thekarananand/.local/share/gnome-shell/extensions
cd extensions
cp * /home/thekarananand/.local/share/gnome-shell/extensions -r >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Rebooting Gnome Shell"

echo "[COMMAND] : killall -3 gnome-shell" >> logs

killall -3 gnome-shell
echo "---------------------------------------------------------------------------------------" >> logs

gnome-shell-extension-tool enable blur-my-shell@aunetx
gnome-shell-extension-tool enable date-menu-formatter@marcinjakubowski.github.com
gnome-shell-extension-tool enable drive-menu@gnome-shell-extensions.gcampax.github.com
gnome-shell-extension-tool enable just-perfection-desktop@just-perfection
gnome-shell-extension-tool enable lockkeys@vaina.lt
gnome-shell-extension-tool enable theme-switcher@fthx
gnome-shell-extension-tool enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-shell-extension-tool enable x11gestures@joseexposito.github.io


neofetch
