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

read -p "Press [ENTER] to Continue ..."

clear
cd ..
cat ./txtmessage/grubCustomizer.txt
echo "[COMMAND] : grub-customizer" 
sudo grub-customizer >> null
cd ..
cd scripts
clear
