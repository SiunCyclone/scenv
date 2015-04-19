#!/bin/bash

function install_pacman_pkg() {
  echo "*** Install Pacman Packages ***"
  echo
  pacman -Syu
}

function main() {
  install_pacman_pkg
  ./all.sh
}

main

