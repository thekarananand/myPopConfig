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
cd instructions

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
