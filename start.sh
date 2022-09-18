cd ./scripts

chmod +x ./pre_installation.sh
./pre_installation.sh
read -p "Press [ENTER] to Continue..."
clear

chmod +x ./installation.sh
./installation.sh
read -p "Press [ENTER] to Continue..."
clear

chmod +x ./sysConfig.sh
./sysConfig.sh
read -p "Press [ENTER] to Continue..."
clear

chmod +x ./extension.sh
./extension.sh
read -p "Press [ENTER] to Continue..."
clear


echo "Now,It's Ready!!..."
neofetch
