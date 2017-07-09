#!/bin/bash

# coreutils
function install_brew_pkg() {
  echo "*** Install Homebrew Packages ***"
  echo
  brew install coreutils
}

function main() {
  install_brew_pkg
}

main

