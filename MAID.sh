#!/data/data/com.termux/files/usr/bin/bash
clear
num=1
core2(){
  archivo=$(ls|wc -l)
  if [ $num -le $archivo ];
  then
  a=$(ls -c|awk NR==$num)
  
  echo $a
  
  
  
  let num=$num+1
  else
  echo son todos los archivos
  sleep 2;
  exit
  fi
  read b
  if [ "$b" = x ];
  then
  exit
  fi
  if [ "$b" = o ];
  then
  ruta=$(pwd)
  q="'"
  termux-open $a
  fi
  if [ "$b" = b ];
  then 
      rm $a
  fi
  core2
  
  
}

core2

