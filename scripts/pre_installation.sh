sudo echo "+---------------------+"
echo "|  Removing Pop-Shop  |"
echo "+---------------------+"
echo ""
echo "[COMMAND] : sudo apt remove pop-shop -y"
echo ""
sudo apt remove pop-shop -y
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
