#!/usr/bin/env bash

OLD_VERSION=$(nvim -V1 --version | head -n 1)

cd /home/dvlp/Build/neovim
git pull origin master
make clean
make distclean
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/home/dvlp/.local/
make install

clear 

echo "Old Version:" $OLD_VERSION

NVIM_BUILD_DIR=$HOME/Build/neovim
echo "New Version:" $($NVIM_BUILD_DIR/build/bin/nvim -V1 --version | head -n 1)
