#!/bin/bash 

cd ~

# Update system
sudo apt-get -y update
sudo apt-get -y upgrade

# Install programs
# sudo apt-get -y install ubuntu-unity-desktop # Ubuntu renderer
# sudo snap install clion --classic # CLion IDE
# sudo snap install pycharm-community --classic # Pycharm Community IDE
sudo snap install --classic code # Visual studio code
sudo snap install ao # Microsoft Todo
# sudo snap install slack --classic # Slack
# sudo snap install teams # Microsoft Teams
# sudo snap install notion-snap # Notion
sudo apt-get -y install kolourpaint # kolourpaint
sudo apt-get -y install peek # peek

wget -nc https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb # Google Chrome
sudo apt -y install ./google-chrome-stable_current_amd64.deb
sudo rm -rf ./google-chrome-stable_current_amd64.deb

wget -nc https://download.teamviewer.com/download/linux/teamviewer_amd64.deb # Teamviewer
sudo apt -y install ./teamviewer_amd64.deb
sudo rm -rf ./teamviewer_amd64.deb

#Dropbox
wget -O dropbox_2020.03.04_amd64.deb "https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb"
sudo apt -y install ./dropbox_2020.03.04_amd64.deb
sudo rm -rf ./dropbox_2020.03.04_amd64.deb

remote_key_file=https://linux.dropbox.com/fedora/rpm-public-key.asc # https://fabianlee.org/2022/12/21/ubuntu-fix-apt-warning-for-dropbox-with-key-in-legacy-keyring/

# Dropbox - validate same ownership as original, and newer expiration date
sudo apt install pgpdump -y
curl -s $remote_key_file | pgpdump | grep -E "User ID -|expiration" -A1

# Dropbox - save new PGP key
curl -s $remote_key_file | sudo tee /usr/share/keyrings/dropbox.asc
sudo chmod 644 /usr/share/keyrings/dropbox.asc

# Dropbox - find dropbox apt repo definition to edit
domain=linux.dropbox.com
sudo grep -srl $domain /etc/apt | grep -v save

# Install essentials
sudo apt-get -y install build-essential cmake git wget curl pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev libglib2.0-dev

mkdir -p ~/miniconda3 # miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

# Python
sudo apt-get -y install python3 python3-pip

# Golang
# snap install --classic go

# Terminal

sudo apt -y install tilix # tilix

sudo apt-get -y install zsh # zsh # ** plz manually install powerlevel10k
echo "(setup_ubuntu.sh) : Setup zsh, and exit!" #zsh

# sudo rm -rf ${ZDOTDIR:-$HOME}/.zprezto
# git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto" # prezto
# echo "" >> ~/.zshrc
# echo "# prezto\n" >> ~/.zshrc
# echo "source \"${ZDOTDIR:-$HOME}/.zprezto/init.zsh\"" >> ~/.zshrc
# chsh -s /bin/zsh

sudo apt-get -y install tmux # tmux

# Rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# rustup override set stable
# rustup update stable

# C++
sudo apt-get -y install cmake ninja-build

# Terminal App (Alacritty)
# git clone https://github.com/alacritty/alacritty.git # Alacritty
# cd alacritty
# cargo build --release
# sudo cp target/release/alacritty /usr/local/bin
# sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
# sudo desktop-file-install extra/linux/Alacritty.desktop
# sudo update-desktop-database

# Docker installation should be reviewed
# # Docker 
# sudo apt-get -y remove docker docker-engine docker.io containerd runc
# sudo apt-get -y install ca-certificates curl gnupg lsb-release
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# sudo apt-get update
# sudo apt-get -y install docker-ce docker-ce-cli containerd.io
# sudo groupadd docker
# sudo usermod -aG docker $USER

# # GitHub CLI
# # curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
# # echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
# # sudo apt-get -y update
# # sudo apt-get -y install gh

# # Nvidia-docker
# sudo systemctl --now enable docker

# distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
#       && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
#       && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
#             sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
#             sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

# sudo apt-get -y update

# sudo apt-get install -y nvidia-container-toolkit
# sudo nvidia-ctk runtime configure --runtime=docker
# sudo systemctl restart docker

# Finished
echo ":::::::::::::::::::::::  fin  :::::::::::::::::::::::"
echo ""
echo "but here's some instruction for Dropbox"
echo "plz edit the file found by sudo vi <theFoundFile>, See https://fabianlee.org/2022/12/21/ubuntu-fix-apt-warning-for-dropbox-with-key-in-legacy-keyring/"
echo "... edit as 'deb [arch=i386,amd64 signed-by=/usr/share/keyrings/dropbox.asc] http://linux.dropbox.com/ubuntu disco main'"
echo ""
echo "for miniconda initialization, execute the commands on bottom of this link(https://docs.conda.io/projects/miniconda/en/latest/) after zsh setting"
echo ""
echo "Now reboot system to apply changes"
