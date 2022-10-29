#!/bin/sh -x
show_text() {
    printf "${LIGHT_CYAN}$1${NO_COLOR}\n" 
}

show_text "-> Sudo update and upgrade..."
sudo apt update -y && sudo apt upgrade -y

show_text "-> Installing wget..." 
sudo apt install wget

show_text "-> Installing chrome..." 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb

show_text "-> Installing git..."
sudo apt install git -y  

show_text "-> Installing curl..."
sudo apt install curl -y

show_text "-> Installing vscode..."
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

show_text "-> Installing gparted..."
sudo apt install gparted -y

show_text "-> Installing font JetBrains Mono..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

show_text "-> Installing nvm..."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

show_text "-> Sudo autoremove and delete directory for settings..." 
sudo apt autoremove -y
