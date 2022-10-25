clear

# VARIBALES DEFINED

CONFIG=/home/$USER/.config/UbuntuSpinner
EXTENSIONS=/home/$USER/.local/share/gnome-shell/extensions

# CREATING REQUIRED DIRECTORY

mkdir -p $CONFIG

if [[ ! -f "$CONFIG/.PROMPTED" ]]
then

    if zenity --question --no-wrap --title='myPopConfig' --text='Do you want to Default Apps ?\n\nThis will install VSCODE + OnlyOffice + Calculus'
    then
        touch $CONFIG/.DEFAULT
    fi

    if zenity --question --title='myPopConfig' --text='Do you want Laptop Specific Settings?'
    then
        touch $CONFIG/.LAPTOP
    fi

	touch $CONFIG/.PROMPTED
fi

# Setting-up the BASE SYSTEM
if [[ ! -f "$CONFIG/.BaseSystem" ]]
then
    # Disable Unwanted Extenstions

		gnome-extensions disable pop-cosmic@system76.com
        	gnome-extensions disable cosmic-dock@system76.com
        	gnome-extensions disable cosmic-workspaces@system76.com
        	gnome-extensions disable popx11gestures@system76.com
    
    # Install Pre-Req
    	
		sudo apt install nala git curl -y

    # APT : Preferences, Repos, & Mirrors

		# Repo for VS CODE
		wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
		sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
		sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
		rm -f packages.microsoft.gpg
		
        	# Repo for JETBRAINS (UNOFFICIAL) Source : https://github.com/JonasGroeger/jetbrains-ppa/
		curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | gpg --dearmor | sudo tee /usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg > /dev/null
		echo "deb [signed-by=/usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg] http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com any main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null

        	# Repo for Grub Customizer
		sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y

        	# Repo for Flatpak
		sudo add-apt-repository ppa:flatpak/stable -y  
		
        	# Repo for Mozilla Firefox
		sudo add-apt-repository ppa:mozillateam/ppa -y
	    
        	# Repo for Android Studio
		sudo add-apt-repository ppa:maarten-fonville/android-studio -y

    # APT mirrors
        	sudo nala fetch --auto -y

    # Clean Up

		sudo nala remove --purge libreoffice* gnome-weather gnome-calendar gnome-contacts totem geary seahorse -y 
        	sudo nala clean
		sudo nala autoremove -y
		

    # Flatpak Setup
    	
    		sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

    # Upgating Existing Packages
		
		sudo nala update
		nala list --upgradable
		sudo nala upgrade -y

		sudo flatpak update -y

    # Base Apps
		sudo nala install firefox vlc grub-customizer grub-efi preload htop gnome-tweaks ubuntu-restricted-extras -y
    		sudo flatpak install flathub com.mattjakeman.ExtensionManager -y

    # Laptop Specific Packages & Config
		if [[ -f "$CONFIG/.LAPTOP" ]]
		then
			sudo nala install tlp tlp-rdw -y 

			sudo tlp start
			sudo systemctl enable tlp
			sudo systemstl start tlp
			
		fi

    # Install Extensions 
    
		mkdir .extensions
		cd .extensions

		wget https://extensions.gnome.org/extension-data/blur-my-shellaunetx.v43.shell-extension.zip
		wget https://extensions.gnome.org/extension-data/date-menu-formattermarcinjakubowski.github.com.v7.shell-extension.zip
		wget https://extensions.gnome.org/extension-data/just-perfection-desktopjust-perfection.v22.shell-extension.zip
		wget https://extensions.gnome.org/extension-data/theme-switcherfthx.v5.shell-extension.zip
		wget https://extensions.gnome.org/extension-data/lockkeysvaina.lt.v47.shell-extension.zip
		wget https://extensions.gnome.org/extension-data/drive-menugnome-shell-extensions.gcampax.github.com.v51.shell-extension.zip
		wget https://extensions.gnome.org/extension-data/user-themegnome-shell-extensions.gcampax.github.com.v49.shell-extension.zip
		
		if [[ -f "$CONFIG/.LAPTOP" ]]
		then
			wget https://extensions.gnome.org/extension-data/x11gesturesjoseexposito.github.io.v14.shell-extension.zip
		fi
		
		unzip blur-my-shellaunetx.v43.shell-extension.zip -d ./blur-my-shell@aunetx/
		unzip date-menu-formattermarcinjakubowski.github.com.v7.shell-extension.zip -d ./date-menu-formatter@marcinjakubowski.github.com/
		unzip just-perfection-desktopjust-perfection.v22.shell-extension.zip -d ./just-perfection-desktop@just-perfection/
		unzip theme-switcherfthx.v5.shell-extension.zip -d ./theme-switcher@fthx/
		unzip lockkeysvaina.lt.v47.shell-extension.zip -d ./lockkeys@vaina.lt/
		unzip drive-menugnome-shell-extensions.gcampax.github.com.v51.shell-extension.zip -d ./drive-menu@gnome-shell-extensions.gcampax.github.com/
		unzip user-themegnome-shell-extensions.gcampax.github.com.v49.shell-extension.zip -d ./user-theme@gnome-shell-extensions.gcampax.github.com/
		
		if [[ -f "$CONFIG/.LAPTOP" ]]
		then
			unzip x11gesturesjoseexposito.github.io.v14.shell-extension.zip -d ./x11gestures@joseexposito.github.io/
		fi
		
		rm blur-my-shellaunetx.v43.shell-extension.zip
		rm date-menu-formattermarcinjakubowski.github.com.v7.shell-extension.zip
		rm just-perfection-desktopjust-perfection.v22.shell-extension.zip
		rm theme-switcherfthx.v5.shell-extension.zip
		rm lockkeysvaina.lt.v47.shell-extension.zip
		rm drive-menugnome-shell-extensions.gcampax.github.com.v51.shell-extension.zip
		rm user-themegnome-shell-extensions.gcampax.github.com.v49.shell-extension.zip
		
		if [[ -f "$CONFIG/.LAPTOP" ]]
		then
			rm x11gesturesjoseexposito.github.io.v14.shell-extension.zip
		fi
		
		mkdir -p $EXTENSIONS
		cp * $EXTENSIONS -r 
		
		cd ..
		
		rm -r ./.extensions
	
    # GRUB CUSTOMIZER

		sudo grub-install 
		sudo cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi
		
		sudo mkdir -p "/boot/grub/themes/"
		sudo cp -a ./grubthemes/* /boot/grub/themes/
		
		sudo cp /etc/default/grub ./
		sudo rm /etc/default/grub
		
		sed -i '/GRUB_GFXMODE=/d' ./grub
		sed -i '/GRUB_TIMEOUT=/d' ./grub
		sed -i '/GRUB_TIMEOUT_STYLE=/d' ./grub

		echo 'GRUB_GFXMODE="auto"' >> ./grub 
		echo 'GRUB_TIMEOUT="10"' >> ./grub
		echo 'GRUB_TIMEOUT_STYLE="menu"' >> ./grub
		
		sudo mv ./grub /etc/default/

		sudo update-grub
		
		clear
		echo "+-------------------+"
		echo "|  Grub Customizer  |"
		echo "+-------------------+"
		echo ""
		echo "Step 1 : In \"List Configuration\" tab, Configure the Boot Enteries."
		echo ""
		echo "Step 2 : In \"Appearance Settings\" tab, Set a Custom Resolution & Select a Theme."
		echo ""
		echo "               +------+"
		echo "Step 3 : Press | Save | then EXIT Grub Customizer Pop-up Window !!...."
		echo "               +------+"
		sudo grub-customizer >> null
		clear
		rm null
		
	touch $CONFIG/.BaseSystem

	zenity --info --title='myPopConfig' --text='This system needs RESTART. Press [OK] to RESTART. After the System restarts, please Re-Execute this Script...'
	reboot

fi

if [[ ! -f "$CONFIG/.BaseSystem2" ]]
then
	# Enabling Extensions
		gnome-extensions enable blur-my-shell@aunetx
		gnome-extensions enable date-menu-formatter@marcinjakubowski.github.com
		gnome-extensions enable drive-menu@gnome-shell-extensions.gcampax.github.com
		gnome-extensions enable just-perfection-desktop@just-perfection
		gnome-extensions enable lockkeys@vaina.lt
		gnome-extensions enable theme-switcher@fthx
		gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
		
		if [[ -f "$CONFIG/.LAPTOP" ]]
		then
			gnome-extensions enable x11gestures@joseexposito.github.io
		fi
	
	# Tweaking Extensions

		gsettings --schemadir $EXTENSIONS/lockkeys@vaina.lt/schemas/  set org.gnome.shell.extensions.lockkeys style 'capslock'	
		gsettings --schemadir $EXTENSIONS/date-menu-formatter@marcinjakubowski.github.com/schemas/ set org.gnome.shell.extensions.date-menu-formatter pattern 'EEEE, MMMM dd | hh : mm a'
		
		if [[ -f "$CONFIG/.LAPTOP" ]]
		then
			gsettings --schemadir $EXTENSIONS/x11gestures@joseexposito.github.io/schemas/  set org.gnome.shell.extensions.x11gestures swipe-fingers 4
		fi
		
		gsettings --schemadir $EXTENSIONS/just-perfection-desktop@just-perfection/schemas/ set org.gnome.shell.extensions.just-perfection theme true
		gsettings --schemadir $EXTENSIONS/just-perfection-desktop@just-perfection/schemas/ set org.gnome.shell.extensions.just-perfection activities-button false
		gsettings --schemadir $EXTENSIONS/just-perfection-desktop@just-perfection/schemas/ set org.gnome.shell.extensions.just-perfection events-button false
		gsettings --schemadir $EXTENSIONS/just-perfection-desktop@just-perfection/schemas/ set org.gnome.shell.extensions.just-perfection world-clock false
		gsettings --schemadir $EXTENSIONS/just-perfection-desktop@just-perfection/schemas/ set org.gnome.shell.extensions.just-perfection weather false
		gsettings --schemadir $EXTENSIONS/just-perfection-desktop@just-perfection/schemas/ set org.gnome.shell.extensions.just-perfection window-demands-attention-focus true
		gsettings --schemadir $EXTENSIONS/just-perfection-desktop@just-perfection/schemas/ set org.gnome.shell.extensions.just-perfection clock-menu-position 1
		gsettings --schemadir $EXTENSIONS/just-perfection-desktop@just-perfection/schemas/ set org.gnome.shell.extensions.just-perfection clock-menu-position-offset 8
		gsettings --schemadir $EXTENSIONS/just-perfection-desktop@just-perfection/schemas/ set org.gnome.shell.extensions.just-perfection notification-banner-position 2
		gsettings --schemadir $EXTENSIONS/just-perfection-desktop@just-perfection/schemas/ set org.gnome.shell.extensions.just-perfection osd-position 5
		gsettings set org.gnome.shell.extensions.ding show-home false
		gsettings set org.gnome.shell.extensions.ding show-trash true
		gsettings set org.gnome.shell.extensions.ding start-corner 'top-left'
		gsettings set org.gnome.shell.extensions.ding show-volumes true

	touch $CONFIG/.BaseSystem2
fi

if [[ -f "$CONFIG/.DEFAULT" ]]
then
    sudo nala install code
    sudo flatpak install flathub com.github.carlos157oliveira.Calculus org.onlyoffice.desktopeditors -y
else
    
    # Optional Apps
		touch .AdditionalAPPS.sh
		#APT
		if zenity --question --title='myPopConfig' --text='Install VS CODE ?'
		then
			echo "sudo nala install code -y" >> .AdditionalAPPS.sh
		fi

		if zenity --question --title='myPopConfig' --text='Install Android Studio ?'
		then
			echo "sudo nala install android-studio -y" >> .AdditionalAPPS.sh
		fi

		if zenity --question --title='myPopConfig' --text='Install PyCharm (Community) ?'
		then
			echo "sudo nala install pycharm-community -y" >> .AdditionalAPPS.sh
		fi

		if zenity --question --title='myPopConfig' --text='Install DataSpell ?'
		then
			echo "sudo nala install dataspell -y" >> .AdditionalAPPS.sh
		fi

		if zenity --question --title='myPopConfig' --text='Install IntelliJ IDEA (Community) ?'
		then
			echo "sudo nala install intellij-idea-community -y" >> .AdditionalAPPS.sh
		fi
		
		# Flatpak
		if zenity --question --title='myPopConfig' --text='Install OnlyOffice ?'
		then
			echo "sudo flatpak install flathub org.onlyoffice.desktopeditors -y" >> .AdditionalAPPS.sh
		fi
		
		if zenity --question --title='myPopConfig' --text='Install Calculus ?'
		then
			echo "sudo flatpak install flathub com.github.carlos157oliveira.Calculus -y" >> .AdditionalAPPS.sh
		fi

    	chmod +x .AdditionalAPPS.sh
    	./.AdditionalAPPS.sh
	    rm ./.AdditionalAPPS.sh

fi


