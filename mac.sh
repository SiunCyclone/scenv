#!/bin/bash

# coreutils
function install_brew_pkg() {
  echo "*** Install Homebrew Packages ***"
  echo
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install coreutils
}

function main() {
  case "${OSTYPE}" in
    darwin*)
      install_brew_pkg
      ./all.sh
      ;;
    *) echo "mac.sh is only for mac system";;
  esac
}

main

