#!/bin/bash

function install_pacman_pkg() {
  echo "*** Install Pacman Packages ***"
  echo
  pacman -S vim zsh ruby
}

function main() {
  install_pacman_pkg
}

main

