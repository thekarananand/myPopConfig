sudo apt remove pop-shop -y
echo "+-------------------+"
echo "|  Installing nala  |"
echo "+-------------------+"
echo ""
echo "[COMMAND] : sudo apt-get install nala -y"
echo ""
sudo apt-get install nala -y
echo ""
echo ""

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
echo ""

echo "+--------------------------------------+"
echo "|  Setting Up PPA for Grub-Customizer  |"
echo "+--------------------------------------+"
echo ""
echo "[COMMAND] : sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y"
echo ""
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
echo ""
echo ""

echo "+----------------------+"
echo "|  Setting Up Flathub  |"
echo "+----------------------+"
echo ""
echo "[COMMAND] : flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"
echo ""
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 
echo ""
echo ""

echo "+--------------------+"
echo "|  Updating Flatpak  |"
echo "+--------------------+"
echo ""
echo "[COMMAND] : flatpak update -y " 
echo "" 
flatpak update -y 
echo ""
echo ""

echo "+--------------------------------------+"
echo "|  Removing Unnecessary .deb Packages  |"
echo "+--------------------------------------+"
echo ""
echo "[COMMAND] : sudo nala remove --purge libreoffice* gnome-weather gnome-calendar gnome-contacts totem geary seahorse -y " 
echo "" 
sudo nala remove --purge libreoffice* gnome-weather gnome-calendar gnome-contacts totem geary seahorse -y 
echo ""
echo ""

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
echo ""

echo "+--------------------------+"
echo "|  Updating .deb Packages  |"
echo "+--------------------------+"
echo "[COMMAND] : sudo nala update && sudo nala upgrade -y" 
echo "" 
sudo nala update && sudo nala upgrade -y 
echo "[COMMAND] : nala list --upgradable"
echo ""
nala list --upgradable 
echo "[COMMAND] : sudo nala update && sudo nala upgrade -y" 
echo "" 
sudo nala update && sudo nala upgrade -y 
echo ""
echo ""

echo "+---------------------+"
echo "|  Installing Codecs  |"
echo "+---------------------+"
echo ""
echo "[COMMAND] : sudo nala install ubuntu-restricted-extras -y" 
echo "" 
sudo nala install ubuntu-restricted-extras -y
echo ""
echo ""

echo "+-------------------+"
echo "|  Installing Apps  |"
echo "+-------------------+"
echo ""
echo "[COMMAND] : sudo nala install pop-shop neofetch htop preload tlp code gnome-tweaks grub-customizer grub-efi grub2-common telegram-desktop discord gnome-software gnome-shell-extensions qbittorrent inkscape vlc geg -y " 
echo "" 
sudo nala install pop-shop neofetch htop preload tlp code gnome-tweaks grub-customizer grub-efi grub2-common telegram-desktop discord gnome-software gnome-shell-extensions qbittorrent inkscape vlc geg -y 
echo ""
echo ""

echo "+---------------------------+"
echo "|  Installing Flatpak Apps  |"
echo "+---------------------------+"
echo ""
echo "[COMMAND] : flatpak install flathub com.mattjakeman.ExtensionManager com.github.carlos157oliveira.Calculus com.github.hugolabe.Wike org.onlyoffice.desktopeditors -y" 
echo "" 
flatpak install flathub com.mattjakeman.ExtensionManager com.github.carlos157oliveira.Calculus com.github.hugolabe.Wike org.onlyoffice.desktopeditors -y
echo ""
echo ""

echo "+--------------------------+"
echo "|  Setting Up tlp.service  |"
echo "+--------------------------+"
echo ""
echo "[COMMAND] : sudo tlp start" 
echo "" 
sudo tlp start
echo ""
echo "[COMMAND] : sudo systemctl enable tlp.service" 
echo "" 
sudo systemctl enable tlp.service 
echo ""
echo ""

echo "+----------------------------+"
echo "|  Building Grub Bootloader  |"
echo "+----------------------------+"
echo ""
echo "[COMMAND] : sudo grub-install" 
echo "" 
sudo grub-install 

echo "+----------------------------------------------------+"
echo "|  Tweaking & Installing Themes for Grub Bootloader  |"
echo "+----------------------------------------------------+"
echo "" 
sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi

sudo mkdir -p "/boot/grub/themes/"
sudo cp -a ./grubthemes/* /boot/grub/themes/

cd grubthemes
chmod +x ./grubconfig.sh
sudo ./grubconfig.sh
cd ..

read -p "Press [ENTER] to Continue & Launch Grub Customizer ..."
clear

cat ./instructions/grubCustomizer.txt
echo "[COMMAND] : grub-customizer" 
grub-customizer >> null
clear

echo "+-----------------------------+"
echo "|  Disabling Old Extenstions  |"
echo "+-----------------------------+"
echo "" 
gnome-extensions disable pop-cosmic@system76.com
gnome-extensions disable cosmic-dock@system76.com
gnome-extensions disable cosmic-workspaces@system76.com
gnome-extensions disable popx11gestures@system76.com
echo ""
echo ""

echo "+------------------------------+"
echo "|  Installing New Extenstions  |"
echo "+------------------------------+"
echo "" 
mkdir /home/$USER/.local/share/gnome-shell/extensions
cd extensions
cp * /home/$USER/.local/share/gnome-shell/extensions -r 
echo ""
echo ""

echo "+-------------------------+"
echo "|  Rebooting Gnome Shell  |"
echo "+-------------------------+"
killall -3 gnome-shell
echo ""
echo ""

echo "+----------------------------+"
echo "|  Enabling New Extenstions  |"
echo "+----------------------------+"

cd extensions
chmod +x ./enableEXT.sh
./enableEXT.sh
cd ..

clear
echo "Now,It's Ready!!..."
neofetch
