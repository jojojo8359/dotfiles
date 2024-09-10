#!/usr/bin/env bash

# OTHER SOFTWARE
# nvm (node + npm)
# neovim

apt_packages=()

apt_packages+=(
  fzf
)

# TODO: smartly only install if not already: https://github.com/cowboy/dotfiles/blob/master/init/20_ubuntu_apt.sh#L323
for package in "${apt_packages[@]}"; do
  echo "Installing $package"
  sudo apt-get -y install "$package"
done


