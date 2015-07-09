#!/bin/bash

function install_pacman_pkg() {
  echo "*** Install Pacman Packages ***"
  echo
  pacman -S vim zsh ruby
}

function main() {
  case "${OSTYPE}" in
    linux*)
      install_pacman_pkg

      . ./import.sh
      install_zsh_plugins
      locate_dotfiles
      ;;
    *) echo "arch.sh is only for Arch Linux system";;
  esac
}

main

