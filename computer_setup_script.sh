#!/usr/bin/bash

# ask for the administrator password upfront
sudo -v

# keep alive, update existing `sudo` time stamp until script has finished
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

###################################################################################
# Script Start
###################################################################################

echo "Hello $(whoami), Welcome to my computer setup script. This script will update and install some applications and tools."

echo "Updating and installing some applications and tools..."

# Update and upgrade
sudo apt update
sudo apt upgrade -y

# create config folder
mkdir -p ${HOME}/.config
mkdir -p ${HOME}/.config

# Install applications
sudo apt install -y vim tmux htop neofetch tree git curl wget vlc obs-studio screenkey unzip p7zip-full xclip python3-pip zsh

# make zsh as default shell
chsh -s $(which zsh)

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# update plugin in .zshrc i.e. zsh-autosuggestions, zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

# install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# customize starship
echo "eval \"\$(starship init zsh)\"" >>~/.zshrc

# install brew
echo "Brew installing..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# installing brew packages
brew install neovim bat k9s gh ffmpeg nodejs brave-browser visual-studio-code 1password skype sublime-text discord zoom slack openaudible audacity docker docker-compose awscli go terraform ansible minikube kind

# Generating ssh key for github
echo "Generating ssh key for github"
ssh-keygen -t ed25519 -C "badalWorks1@gmail.com" -f ~/.ssh/id_ed25519
eval "$(ssh-agent -s)"
touch ~/.ssh/config
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config
ssh-add -K ~/.ssh/id_ed25519
echo "run 'pbcopy < ~/.ssh/id_ed25519.pub' and paste that into github"

# git clone https://github.com/HeyBadAl/dotfiles
echo "cloning dotfiles"
git clone https://github.com/HeyBadAl/dotfiles

# create symblinks
echo "Creating Symblinks"
ln -s "${HOME}/dotfiles/.zshrc" "${HOME}/.zshrc"
ln -s "${HOME}/dotfiles/.gitconfig" "${HOME}/.gitconfig"
ln -s "${HOME}/dotfiles/.tmux.conf" "${HOME}/.tmux.conf"
ln -s "${HOME}/dotfiles/starship.toml" "${HOME}/.config/starship.toml"
ln -s "${HOME}/dotfiles/.fonts" "${HOME}/.fonts"
ln -s "${HOME}/dotfiles/nvim" "${HOME}/.config/nvim"
ln -s "${HOME}/dotfiles/k9s" "${HOME}/.config/k9s"

# set up docker
echo "setting up docker"
sudo groupadd docker
sudo usermod -aG docker $(whoami)

# install kubectl
echo "installing kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
