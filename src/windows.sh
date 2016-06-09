#!/bin/bash

function install_pacman_pkg() {
  echo "*** Install Pacman Packages ***"
  echo
  ruby -e "
    pkgs = \"vim git zsh ruby wget make gdb \" +
    (/i(3|6)86/ =~ \`uname -a\`.to_s ?
      \"mingw-w64-i686-clang mingw-w64-i686-SDL2\" :
      \"mingw-w64-x86_64-clang mingw-w64-x86_64-SDL2\")
    \`pacman -Su #{pkgs}\`
  "
}

# Enable symlink
# Set zsh as login shell
function modify_msys_batfile() {
  echo "*** Modify msys2 batfile ***"
  echo
  ruby -e "
    text = ''
    msysPath = /i(3|6)86/ =~ \`uname -a\`.to_s ? 'C:/msys32/' : 'C:/msys64/'
    open(msysPath + 'msys2_shell.bat') do |f|
      text = f.read
      text.gsub!('rem set MSYS=winsymlinks:nativestrict', 'set MSYS=winsymlinks:nativestrict')
      text.gsub!('start %WD%mintty -i /msys2.ico /usr/bin/bash --login %*', 'start %WD%mintty -i /msys2.ico /usr/bin/zsh --login %*')
    end

    open(msysPath + 'msys2_shell.bat', 'w') do |f|
      f.write(text)
    end
  "
  export MSYS=winsymlinks:nativestrict
}

function main() {
  install_pacman_pkg
  modify_msys_batfile
}

main

