touch logs
script logs

echo "+-------------------+"
echo "|  Installing nala  |"
echo "+-------------------+"
echo ""
echo "[COMMAND] : sudo apt-get install nala -y"
echo ""
sudo apt-get install nala -y
echo ""
read -p "Press [ENTER] to continue ..."
clear

echo "+-------------------------------------------+"
echo "|  Setting Up Microsoft's Repo for VS CODE  |"
echo "+-------------------------------------------+"
echo ""
echo "[COMMAND] : wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg"
echo ""
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
echo "[COMMAND] : sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg"
echo ""
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "[COMMAND] : sudo sh -c 'echo \"deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main\" > /etc/apt/sources.list.d/vscode.list'"
echo ""
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
echo "[COMMAND] : rm -f packages.microsoft.gpg"
echo ""
rm -f packages.microsoft.gpg
echo ""
read -p "Press [ENTER] to continue ..."
clear

echo "+--------------------------------------+"
echo "|  Setting Up PPA for Grub-Customizer  |"
echo "+--------------------------------------+"
echo ""
echo "[COMMAND] : sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y"
echo ""
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
echo ""
read -p "Press [ENTER] to continue ..."
clear

echo "+----------------------+"
echo "|  Setting Up Flathub  |"
echo "+----------------------+"
echo ""
echo "[COMMAND] : flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"
echo ""
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 
echo ""
read -p "Press [ENTER] to continue ..."
clear

echo "+--------------------+"
echo "|  Updating Flatpak  |"
echo "+--------------------+"
echo ""
echo "[COMMAND] : flatpak update -y " 
echo "" 
flatpak update -y 
echo ""
read -p "Press [ENTER] to continue ..."
clear

echo "+--------------------------------------+"
echo "|  Removing Unnecessary .deb Packages  |"
echo "+--------------------------------------+"
echo ""
echo "[COMMAND] : sudo apt-get remove --purge libreoffice* gnome-weather gnome-calendar gnome-contacts totem geary seahorse -y " 
echo "" 
sudo apt-get remove --purge libreoffice* gnome-weather gnome-calendar gnome-contacts totem geary seahorse -y 
echo ""
read -p "Press [ENTER] to continue ..."
clear

echo "+---------------+"
echo "|  Cleaning Up  |"
echo "+---------------+"
echo ""
echo "[COMMAND] : sudo nala clean" 
echo "" 
sudo nala clean 
echo "[COMMAND] : sudo nala autoremove --assume-yes" 
echo "" 
sudo nala autoremove --assume-yes
echo ""
read -p "Press [ENTER] to continue ..."
clear

echo "+--------------------------+"
echo "|  Updating .deb Packages  |"
echo "+--------------------------+"
echo ""
echo "[COMMAND] : nala list --upgradable"
echo ""
nala list --upgradable 
echo "[COMMAND] : sudo nala update && sudo nala upgrade -y" 
echo "" 
sudo nala update && sudo nala upgrade -y 
echo ""
read -p "Press [ENTER] to continue ..."
clear

echo "Installing Codecs"
echo "[COMMAND] : sudo nala install ubuntu-restricted-extras -y" 
sudo nala install ubuntu-restricted-extras -y
echo ""
read -p "Press [ENTER] to continue ..."
clear

echo "Installing Apps"
echo "[COMMAND] : " 
echo "sudo nala install neofetch htop preload tlp code gnome-tweaks grub-customizer grub-efi grub2-common telegram-desktop discord gnome-software gnome-shell-extensions qbittorrent inkscape vlc geg -y " 
sudo nala install neofetch htop preload tlp code gnome-tweaks grub-customizer grub-efi grub2-common telegram-desktop discord gnome-software gnome-shell-extensions qbittorrent inkscape vlc geg -y 
echo ""
read -p "Press [ENTER] to continue ..."
clear

echo "Installing Flatpak Apps"
echo "[COMMAND] : flatpak install flathub com.mattjakeman.ExtensionManager com.github.carlos157oliveira.Calculus com.github.hugolabe.Wike org.onlyoffice.desktopeditors -y" 
echo "" 
flatpak install flathub com.mattjakeman.ExtensionManager com.github.carlos157oliveira.Calculus com.github.hugolabe.Wike org.onlyoffice.desktopeditors -y
echo ""
read -p "Press [ENTER] to continue ..."
clear

echo "Setting Up tlp.service"
echo "[COMMAND] : sudo systemctl enable tlp.service" 
echo "" 
sudo systemctl enable tlp.service 
echo ""
read -p "Press [ENTER] to continue ..."
clear

echo "Building Grub Bootloader"
echo "[COMMAND] : sudo grub-install" 
echo "" 
sudo grub-install 
echo "[COMMAND] : sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi" 
sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi

mkdir -p "/boot/grub/themes/ROG"
mkdir -p "/boot/grub/themes/Decent"
cp -a ./themes/ROG/* "/boot/grub/themes/ROG"
cp -a ./themes/Decent/* "/boot/grub/themes/Decent"
echo 'GRUB_TIMEOUT_STYLE="menu"' >> /etc/default/grub
echo 'GRUB_TIMEOUT="10"' >> /etc/default/grub
echo "GRUB_THEME=\"/boot/grub/themes/Decent/theme.txt\"" >> /etc/default/grub
echo 'GRUB_GFXMODE="auto"' >> /etc/default/grub 

echo "[COMMAND] : sudo grub-customizer" 
sudo grub-customizer 
echo ""
read -p "Press [ENTER] to continue ..."
clear



echo "Disabling Old Extenstions"

gnome-extensions disable pop-cosmic@system76.com
gnome-extensions disable cosmic-dock@system76.com
gnome-extensions disable cosmic-workspaces@system76.com
gnome-extensions disable popx11gestures@system76.com
echo ""
read -p "Press [ENTER] to continue ..."
clear


echo "Installing New Extenstions"

echo "[COMMAND] : mkdir /home/$USER/.local/share/gnome-shell/extensions" 
echo "[COMMAND] : cd extensions" 
echo "[COMMAND] : cp * /home/$USER/.local/share/gnome-shell/extensions -r" 

mkdir /home/$USER/.local/share/gnome-shell/extensions
cd extensions
cp * /home/$USER/.local/share/gnome-shell/extensions -r 
echo ""
read -p "Press [ENTER] to continue ..."
clear


echo "Rebooting Gnome Shell"

echo "[COMMAND] : killall -3 gnome-shell" 

killall -3 gnome-shell



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

echo "[COMMAND] : killall -3 gnome-shell" 

killall -3 gnome-shell


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


echo "Rebooting Gnome Shell"

echo "[COMMAND] : killall -3 gnome-shell" 

killall -3 gnome-shell


neofetch
