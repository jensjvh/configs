#!/usr/bin/env bash

# shell
chsh -s /usr/bin/zsh
#######

cd ~

# packages
sudo dnf upgrade --refresh -y
sudo dnf install -y git wget tree-sitter-cli tmux foot
###################

# neovim
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x84_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz && rm -f nvim-linux-x86_64.tar.gz
echo PATH="$PATH:/opt/nvim-linux-x86_64/bin" >> ~/.zshrc
########

# dotfiles
git clone https://github.com/jensjvh/configs.git
cp -r configs/dotfiles/.* .
##########

# tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
######

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
###########

# foot
mkdir -p ~/.config/foot
cp configs/foot.ini ~/.config/foot/
