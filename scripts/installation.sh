echo "+-------------------+"
echo "|  Installing nala  |"
echo "+-------------------+"
echo ""
echo "[COMMAND] : sudo apt-get install nala -y"
echo ""
sudo apt-get install nala -y
echo ""
echo ""

echo "+--------------------------+"
echo "|  Updating .deb Packages  |"
echo "+--------------------------+"
echo ""
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
