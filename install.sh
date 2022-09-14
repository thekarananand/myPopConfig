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
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

echo "[COMMAND] : sudo sh -c 'echo \"deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main\" > /etc/apt/sources.list.d/vscode.list'" >> logs
echo "" >> logs
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

echo "[COMMAND] : rm -f packages.microsoft.gpg" >> logs
echo "" >> logs
rm -f packages.microsoft.gpg

echo "---------------------------------------------------------------------------------------" >> logs

echo "Setting Up PPA for Grub-Customizer"

echo "sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y" >> logs

sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Setting Up Flathub"

echo "[COMMAND] : flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo" >> logs
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo >> logs

echo "---------------------------------------------------------------------------------------" >> logs

echo "Updating Flatpak"

echo "[COMMAND] : flatpak update -y " >> logs
echo "" >> logs
flatpak update -y >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Removing Unnecessary .deb Packages"

echo "[COMMAND] : sudo apt-get remove --purge libreoffice* gnome-weather gnome-calendar gnome-contacts totem geary seahorse -y " >> logs
echo "" >> logs
sudo apt-get remove --purge libreoffice* gnome-weather gnome-calendar gnome-contacts totem geary seahorse -y >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Cleaning Up"

echo "[COMMAND] : sudo nala clean" >> logs
echo "" >> logs
sudo nala clean >> logs

echo "[COMMAND] : sudo nala autoremove --assume-yes" >> logs
echo "" >> logs
sudo nala autoremove --assume-yes>> logs

echo "---------------------------------------------------------------------------------------" >> logs

echo "Updating .deb Packages"

# echo "[COMMAND] : sudo nala update && sudo nala upgrade -y" >> logs
# echo "" >> logs
# sudo nala update && sudo nala upgrade -y >> logs

echo "[COMMAND] : nala list --upgradable" >> logs
echo "" >> logs
nala list --upgradable >> logs

echo "[COMMAND] : sudo nala update && sudo nala upgrade -y" >> logs
echo "" >> logs
sudo nala update && sudo nala upgrade -y >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Installing Codecs"
echo "[COMMAND] : sudo nala install ubuntu-restricted-extras -y" >> logs

sudo nala install ubuntu-restricted-extras -y
echo "---------------------------------------------------------------------------------------" >> logs
echo "Installing Apps"
echo "[COMMAND] : " >> logs
echo "sudo nala install neofetch htop preload tlp code gnome-tweaks grub-customizer grub-efi grub2-common telegram-desktop discord gnome-software gnome-shell-extensions qbittorrent inkscape vlc geg -y " >> logs
sudo nala install neofetch htop preload tlp code gnome-tweaks grub-customizer grub-efi grub2-common telegram-desktop discord gnome-software gnome-shell-extensions qbittorrent inkscape vlc geg -y >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Installing Flatpak Apps"
echo "[COMMAND] : flatpak install flathub com.mattjakeman.ExtensionManager com.github.carlos157oliveira.Calculus com.github.hugolabe.Wike org.onlyoffice.desktopeditors -y" >> logs
echo "" >> logs
flatpak install flathub com.mattjakeman.ExtensionManager com.github.carlos157oliveira.Calculus com.github.hugolabe.Wike org.onlyoffice.desktopeditors -y

echo "---------------------------------------------------------------------------------------" >> logs

echo "Setting Up tlp.service"
echo "[COMMAND] : sudo systemctl enable tlp.service" >> logs
echo "" >> logs
sudo systemctl enable tlp.service >> logs

echo "---------------------------------------------------------------------------------------" >> logs

echo "Building Grub Bootloader"
echo "[COMMAND] : sudo grub-install" >> logs
echo "" >> logs
sudo grub-install >> logs
echo "[COMMAND] : sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi" >> logs
sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi

mkdir -p "/boot/grub/themes/ROG"
mkdir -p "/boot/grub/themes/Decent"
cp -a ./themes/ROG/* "/boot/grub/themes/ROG"
cp -a ./themes/Decent/* "/boot/grub/themes/Decent"
echo 'GRUB_TIMEOUT_STYLE="menu"' >> /etc/default/grub
echo 'GRUB_TIMEOUT="10"' >> /etc/default/grub
echo "GRUB_THEME=\"/boot/grub/themes/Decent/theme.txt\"" >> /etc/default/grub
echo 'GRUB_GFXMODE="auto"' >> /etc/default/grub 

echo "[COMMAND] : sudo grub-customizer" >> logs
sudo grub-customizer >> logs

echo "---------------------------------------------------------------------------------------" >> logs

echo "Disabling Old Extenstions"

gnome-extensions disable pop-cosmic@system76.com
gnome-extensions disable cosmic-dock@system76.com
gnome-extensions disable cosmic-workspaces@system76.com
gnome-extensions disable popx11gestures@system76.com

echo "---------------------------------------------------------------------------------------" >> logs

echo "Installing New Extenstions"

echo "[COMMAND] : mkdir /home/$USER/.local/share/gnome-shell/extensions" >> logs
echo "[COMMAND] : cd extensions" >> logs
echo "[COMMAND] : cp * /home/$USER/.local/share/gnome-shell/extensions -r" >> logs

mkdir /home/$USER/.local/share/gnome-shell/extensions
cd extensions
cp * /home/$USER/.local/share/gnome-shell/extensions -r >> logs
echo "---------------------------------------------------------------------------------------" >> logs

echo "Rebooting Gnome Shell"

echo "[COMMAND] : killall -3 gnome-shell" >> logs

killall -3 gnome-shell

echo "---------------------------------------------------------------------------------------" >> logs

echo "Enabling New Extenstions"

flatpak run com.mattjakeman.ExtensionManager

gnome-extensions enable blur-my-shell@aunetx
gnome-extensions enable date-menu-formatter@marcinjakubowski.github.com
gnome-extensions enable drive-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable just-perfection-desktop@just-perfection
gnome-extensions enable lockkeys@vaina.lt
gnome-extensions enable theme-switcher@fthx
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable x11gestures@joseexposito.github.io

echo "Rebooting Gnome Shell"

echo "[COMMAND] : killall -3 gnome-shell" >> logs

killall -3 gnome-shell
echo "---------------------------------------------------------------------------------------" >> logs

gnome-extensions prefs x11gestures@joseexposito.github.io
clear
read -p "Press any key to continue ..."
gnome-extensions prefs lockkeys@vaina.lt
clear
read -p "Press any key to continue ..."
gnome-extensions prefs date-menu-formatter@marcinjakubowski.github.com
clear
read -p "Press any key to continue ..."
gnome-extensions prefs just-perfection-desktop@just-perfection
clear
read -p "Press any key to continue ..."
echo "---------------------------------------------------------------------------------------" >> logs

echo "Rebooting Gnome Shell"

echo "[COMMAND] : killall -3 gnome-shell" >> logs

killall -3 gnome-shell
echo "---------------------------------------------------------------------------------------" >> logs

neofetch
