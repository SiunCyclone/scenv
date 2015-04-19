#!/bin/bash

function install_pacman_pkg() {
  echo "*** Install Pacman Packages ***"
  echo
  pacman -Syu
}

function main() {
  case "${OSTYPE}" in
    linux*)
      install_pacman_pkg
      ./all.sh
      ;;
    *) echo "linux.sh is only for linux system";;
  esac
}

main

