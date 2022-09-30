# THIS WORKS !!...

sudo apt-get install nala -y

sudo nala remove --purge pop-shop libreoffice* gnome-weather gnome-calendar gnome-contacts totem geary seahorse -y 

#---------------------------------------------------------------------------------------

gnome-extensions disable pop-cosmic@system76.com
gnome-extensions disable cosmic-dock@system76.com
gnome-extensions disable cosmic-workspaces@system76.com
gnome-extensions disable popx11gestures@system76.com

#---------------------------------------------------------------------------------------

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

rm -f packages.microsoft.gpg

#---------------------------------------------------------------------------------------

sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y

#---------------------------------------------------------------------------------------

sudo nala update && sudo nala upgrade -y 
nala list --upgradable
sudo nala update && sudo nala upgrade -y 

#---------------------------------------------------------------------------------------

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 

#---------------------------------------------------------------------------------------

flatpak update -y 

#---------------------------------------------------------------------------------------

sudo nala install ubuntu-restricted-extras -y

sudo nala install pop-shop neofetch htop preload tlp code gnome-tweaks grub-customizer grub-efi grub2-common telegram-desktop discord gnome-software gnome-shell-extensions qbittorrent inkscape vlc geg -y 

flatpak install flathub com.mattjakeman.ExtensionManager com.github.carlos157oliveira.Calculus com.github.hugolabe.Wike org.onlyoffice.desktopeditors -y

#---------------------------------------------------------------------------------------

sudo nala clean 

sudo nala autoremove -y

#---------------------------------------------------------------------------------------

sudo tlp start
sudo systemctl enable tlp.service 

#---------------------------------------------------------------------------------------

sudo grub-install 
sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi
sudo mkdir -p "/boot/grub/themes/"
sudo cp -a ./grubthemes/* /boot/grub/themes/

cat ./txtmessage/grubCustomizer.txt
echo "[COMMAND] : grub-customizer" 
sudo grub-customizer >> null

read -p "Press [ENTER] to continue"

#---------------------------------------------------------------------------------------

# THIS DOESN'T WORKS 

mkdir extensions
cd extensions



wget https://extensions.gnome.org/extension-data/blur-my-shellaunetx.v43.shell-extension.zip
wget https://extensions.gnome.org/extension-data/date-menu-formattermarcinjakubowski.github.com.v7.shell-extension.zip
wget https://extensions.gnome.org/extension-data/just-perfection-desktopjust-perfection.v22.shell-extension.zip
wget https://extensions.gnome.org/extension-data/theme-switcherfthx.v5.shell-extension.zip
wget https://extensions.gnome.org/extension-data/lockkeysvaina.lt.v47.shell-extension.zip
wget https://extensions.gnome.org/extension-data/drive-menugnome-shell-extensions.gcampax.github.com.v51.shell-extension.zip
wget https://extensions.gnome.org/extension-data/user-themegnome-shell-extensions.gcampax.github.com.v49.shell-extension.zip
wget https://extensions.gnome.org/extension-data/x11gesturesjoseexposito.github.io.v14.shell-extension.zip


unzip blur-my-shellaunetx.v43.shell-extension.zip -d ./blur-my-shell@aunetx/
unzip date-menu-formattermarcinjakubowski.github.com.v7.shell-extension.zip -d ./date-menu-formatter@marcinjakubowski.github.com/
unzip just-perfection-desktopjust-perfection.v22.shell-extension.zip -d ./just-perfection-desktop@just-perfection/
unzip theme-switcherfthx.v5.shell-extension.zip -d ./theme-switcher@fthx/
unzip lockkeysvaina.lt.v47.shell-extension.zip -d ./lockkeys@vaina.lt/
unzip drive-menugnome-shell-extensions.gcampax.github.com.v51.shell-extension.zip -d ./drive-menu@gnome-shell-extensions.gcampax.github.com/
unzip user-themegnome-shell-extensions.gcampax.github.com.v49.shell-extension.zip -d ./user-theme@gnome-shell-extensions.gcampax.github.com/
unzip x11gesturesjoseexposito.github.io.v14.shell-extension.zip -d ./x11gestures@joseexposito.github.io/


rm blur-my-shellaunetx.v43.shell-extension.zip
rm date-menu-formattermarcinjakubowski.github.com.v7.shell-extension.zip
rm just-perfection-desktopjust-perfection.v22.shell-extension.zip
rm theme-switcherfthx.v5.shell-extension.zip
rm lockkeysvaina.lt.v47.shell-extension.zip
rm drive-menugnome-shell-extensions.gcampax.github.com.v51.shell-extension.zip
rm user-themegnome-shell-extensions.gcampax.github.com.v49.shell-extension.zip
rm x11gesturesjoseexposito.github.io.v14.shell-extension.zip


mkdir /home/$USER/.local/share/gnome-shell/extensions
cp * /home/$USER/.local/share/gnome-shell/extensions -r 

killall -3 gnome-shell

cd ..

#---------------------------------------------------------------------------------------


gnome-extensions enable blur-my-shell@aunetx
gnome-extensions enable date-menu-formatter@marcinjakubowski.github.com
gnome-extensions enable drive-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable just-perfection-desktop@just-perfection
gnome-extensions enable lockkeys@vaina.lt
gnome-extensions enable theme-switcher@fthx
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable x11gestures@joseexposito.github.io

#---------------------------------------------------------------------------------------

cd txtmessage

gnome-extensions prefs x11gestures@joseexposito.github.io
clear
cat x11gestures.txt
read -p "Press [ENTER] to continue ..."

gnome-extensions prefs lockkeys@vaina.lt
clear
cat lockkeys.txt
read -p "Press [ENTER] to continue ..."

gnome-extensions prefs date-menu-formatter@marcinjakubowski.github.com
clear
cat date-menu-formatter.txt
read -p "Press [ENTER] to continue ..."

gnome-extensions prefs just-perfection-desktop@just-perfection
clear
cat just-perfection.txt
read -p "Press [ENTER] to continue ..."

gnome-extensions prefs ding@rastersoft.com
clear
cat ding.txt
read -p "Press [ENTER] to continue ..."

cd ..

#---------------------------------------------------------------------------------------


