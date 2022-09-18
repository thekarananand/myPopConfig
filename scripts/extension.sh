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

cd ..

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

cd ..
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
cd scripts
