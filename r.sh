#!/system/bin/bash

core(){
  
  pkg install zsh -y
  pkg install git -y
  pkg install termux-api
  termux-open *.apk
  
  
  
}
core
