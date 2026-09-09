#!/usr/bin/env bash

cd ~

# packages
sudo dnf upgrade --refresh -y
sudo dnf install -y git wget tree-sitter-cli tmux foot zsh
###################

# shell
usermod -s /usr/bin/zsh $(whoami)
#######

# oh my zsh
CHSH=no RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
###########

# tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
######

# dotfiles
git clone https://github.com/jensjvh/configs.git
cp -r configs/dotfiles/.* .
##########

# neovim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz && rm -f nvim-linux-x86_64.tar.gz
echo PATH="$PATH:/opt/nvim-linux-x86_64/bin" >> ~/.zshrc
########

# foot
mkdir -p ~/.config/foot
cp configs/foot.ini ~/.config/foot/
