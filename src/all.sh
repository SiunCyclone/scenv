#!/bin/bash

# zsh-autosuggestions
function install_zsh_plugins() {
  echo "*** Install Zsh Plugins ***"
  echo
  if [ ! -e $HOME/.zsh-autosuggestions ]; then
    git clone git://github.com/tarruda/zsh-autosuggestions $HOME/.zsh-autosuggestions
  fi
}

function locate_dotfiles() {
  echo "*** Locating dotfiles ***"
  echo
  git clone https://github.com/SiunCyclone/dotfiles.git $HOME/dotfiles
  cd $HOME/dotfiles
  git submodule update --init
  ./locate.sh
}

function main() {
  #install_zsh_plugins
  locate_dotfiles
}

main

