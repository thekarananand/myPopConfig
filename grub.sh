sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
sudo apt install grub-customizer grub-efi grub2-common -y
sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi

mkdir -p "/boot/grub/themes/ROG"
mkdir -p "/boot/grub/themes/Decent"

cp -a ./grubtheme/ROG/* "/boot/grub/themes/ROG"
cp -a ./grubtheme/Decent/* "/boot/grub/themes/Decent"

echo 'GRUB_TIMEOUT_STYLE="menu"' >> /etc/default/grub
echo 'GRUB_TIMEOUT="10"' >> /etc/default/grub
# echo "GRUB_THEME=\"/boot/grub/themes/ROG/theme.txt\"" >> /etc/default/grub
echo "GRUB_THEME=\"/boot/grub/themes/Decent/theme.txt\"" >> /etc/default/grub
echo 'GRUB_GFXMODE="auto"' >> /etc/default/grub 

sudo grub-customizer
