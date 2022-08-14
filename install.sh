#!/bin/bash

set -e

if [ ! -e /bin/zsh ]
then
	echo "Please, install zsh first"
	exit 1
fi

echo "Copying files..."

echo "Copy... ~/.zshrc && /root/.zshrc"
sudo cp ./assets/~/.zshrc ~/.zshrc
sudo cp ./assets/~/.zshrc /root/.zshrc

echo "Copy... /etc/zsh && /etc/zsh_command_not_found"
sudo cp -r ./assets/etc/{zsh,zsh_command_not_found} /etc/

echo "Copy... /usr/share/zsh-autosuggestions && /usr/share/zsh-syntax-highlighting"
sudo cp -r ./assets/usr/share/{zsh-autosuggestions,zsh-syntax-highlighting} /usr/share/

echo -e "\nAll done!"

##########################


user=$USER

read -p "Would you like to set zsh as default shell? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	sudo chsh -s /bin/zsh $user
	sudo chsh -s /bin/zsh root
	zsh
else
	echo -e "\nTo set zsh as default shell type:"
	echo "sudo chsh -s /bin/zsh $user"
	echo -e "\nTry kali zsh now! Just type: zsh"

fi


exit 0
