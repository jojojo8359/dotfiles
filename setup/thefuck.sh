#!/usr/bin/env bash

# Ubuntu - install via apt and pip

apt_packages=()

apt_packages+=(
  python3-dev
  python3-pip
  python3-setuptools
)

# TODO: smartly only install if not already: https://github.com/cowboy/dotfiles/blob/master/init/20_ubuntu_apt.sh#L323
for package in "${apt_packages[@]}"; do
  echo "Installing $package"
  sudo apt-get -y install "$package"
done

# Install thefuck via pip3 (in user space - $HOME/.local/bin)
pip3 install thefuck --user

# Check if the path is set for thefuck to work correctly
if [[ ":$PATH:" == *":$HOME/.local/bin:"* ]]; then
  echo "** Path is set correctly for thefuck to work!"
else
  echo "** Path is missing $HOME/.local/bin, please add it for thefuck to work!"
fi

# Check if the eval statement is in .bashrc
#if grep -q "eval \"$(thefuck --alias)\"" $HOME/.bashrc
