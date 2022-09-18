sudo echo "+---------------------+"
echo "|  Removing Pop-Shop  |"
echo "+---------------------+"
echo ""
echo "[COMMAND] : sudo apt remove pop-shop -y"
echo ""
sudo apt remove pop-shop -y
echo ""
echo ""

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
echo 'GRUB_TIMEOUT_STYLE="menu"' >> /etc/default/grub
echo 'GRUB_TIMEOUT="10"' >> /etc/default/grub
echo "GRUB_THEME=\"/boot/grub/themes/Decent/theme.txt\"" >> /etc/default/grub
echo 'GRUB_GFXMODE="auto"' >> /etc/default/grub 
clear
cat ./txtmessage/grubCustomizer.txt
echo "[COMMAND] : grub-customizer" 
touch temp
grub-customizer >> temp
rm temp
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

echo "+--------------------------------------------+"
echo "|  Downloading & Installing New Extenstions  |"
echo "+--------------------------------------------+"
echo "" 

mkdir extensions
cd extensions

wget https://extensions.gnome.org/extension-data/blur-my-shellaunetx.v43.shell-extension.zip
mkdir blur-my-shell@aunetx
unzip -q -o blur-my-shellaunetx.v43.shell-extension.zip -d ./blur-my-shell@aunetx/
rm blur-my-shellaunetx.v43.shell-extension.zip

wget https://extensions.gnome.org/extension-data/date-menu-formattermarcinjakubowski.github.com.v7.shell-extension.zip
mkdir date-menu-formatter@marcinjakubowski.github.com
unzip date-menu-formattermarcinjakubowski.github.com.v7.shell-extension.zip -d ./date-menu-formatter@marcinjakubowski.github.com/
rm date-menu-formattermarcinjakubowski.github.com.v7.shell-extension.zip

wget https://extensions.gnome.org/extension-data/just-perfection-desktopjust-perfection.v22.shell-extension.zip
mkdir just-perfection-desktop@just-perfection
unzip -q -o just-perfection-desktopjust-perfection.v22.shell-extension.zip -d ./just-perfection-desktop@just-perfection/
rm just-perfection-desktopjust-perfection.v22.shell-extension.zip

wget https://extensions.gnome.org/extension-data/theme-switcherfthx.v5.shell-extension.zip
mkdir theme-switcher@fthx
unzip theme-switcherfthx.v5.shell-extension.zip -d ./theme-switcher@fthx76/
rm theme-switcherfthx.v5.shell-extension.zip

wget https://extensions.gnome.org/extension-data/lockkeysvaina.lt.v47.shell-extension.zip
mkdir lockkeys@vaina.lt
unzip -q -o lockkeysvaina.lt.v47.shell-extension.zip -d ./lockkeys@vaina.lt/
rm lockkeysvaina.lt.v47.shell-extension.zip

wget https://extensions.gnome.org/extension-data/drive-menugnome-shell-extensions.gcampax.github.com.v51.shell-extension.zip
mkdir date-menu-formatter@marcinjakubowski.github.com
unzip -q -o drive-menugnome-shell-extensions.gcampax.github.com.v51.shell-extension.zip -d ./date-menu-formatter@marcinjakubowski.github.com/
rm drive-menugnome-shell-extensions.gcampax.github.com.v51.shell-extension.zip

wget https://extensions.gnome.org/extension-data/user-themegnome-shell-extensions.gcampax.github.com.v49.shell-extension.zip
mkdir user-theme@gnome-shell-extensions.gcampax.github.com
unzip -q -o user-themegnome-shell-extensions.gcampax.github.com.v49.shell-extension.zip -d ./user-theme@gnome-shell-extensions.gcampax.github.com/
rm user-themegnome-shell-extensions.gcampax.github.com.v49.shell-extension.zip

wget https://extensions.gnome.org/extension-data/x11gesturesjoseexposito.github.io.v14.shell-extension.zip
mkdir x11gestures@joseexposito.github.io
unzip -q -o x11gesturesjoseexposito.github.io.v14.shell-extension.zip -d ./x11gestures@joseexposito.github.io/
rm x11gesturesjoseexposito.github.io.v14.shell-extension.zip

mkdir /home/$USER/.local/share/gnome-shell/extensions
cp * /home/$USER/.local/share/gnome-shell/extensions -r 

cd ..

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

flatpak run com.mattjakeman.ExtensionManager

gnome-extensions enable blur-my-shell@aunetx
gnome-extensions enable date-menu-formatter@marcinjakubowski.github.com
gnome-extensions enable drive-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable just-perfection-desktop@just-perfection
gnome-extensions enable lockkeys@vaina.lt
gnome-extensions enable theme-switcher@fthx
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable x11gestures@joseexposito.github.io

cd txtmessage

gnome-extensions prefs x11gestures@joseexposito.github.io
clear
cat x11gestures.txt
read -p "Press any key to continue ..."

gnome-extensions prefs lockkeys@vaina.lt
clear
cat lockkeys.txt
read -p "Press any key to continue ..."

gnome-extensions prefs date-menu-formatter@marcinjakubowski.github.com
clear
cat date-menu-formatter.txt
read -p "Press any key to continue ..."

gnome-extensions prefs just-perfection-desktop@just-perfection
clear
cat just-perfection.txt
read -p "Press any key to continue ..."

gnome-extensions prefs ding@rastersoft.com
clear
cat ding.txt
read -p "Press any key to continue ..."

cd ..
cd scripts

echo "Now,It's Ready!!..."
neofetch