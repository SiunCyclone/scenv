#!/bin/bash

function install_pacman_pkg() {
  echo "*** Install Pacman Packages ***"
  echo
  pacman -Su vim git zsh ruby
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
  case "${OSTYPE}" in
    msys*)
      install_pacman_pkg
      modify_msys_batfile

      . ./import.sh
      install_zsh_plugins
      locate_dotfiles
      ;;
    *) echo "windows.sh is only for windows system";;
  esac
}

main

