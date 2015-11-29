#!/bin/bash

function install_pacman_pkg() {
  echo "*** Install Pacman Packages ***"
  echo
  sudo pacman -S vim zsh ruby
}

function main() {
  install_pacman_pkg
}

main

