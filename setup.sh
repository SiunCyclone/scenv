#!/bin/bash

function main() {
  case "${OSTYPE}" in
    msys*   ) . ./src/windows.sh             ;;
    darwin* ) . ./src/darwin.sh              ;;
    linux*  ) . ./src/arch.sh                ;;
    *       ) echo "Couldn't detect the OS" ;;
  esac

  . ./src/all.sh
}

main

