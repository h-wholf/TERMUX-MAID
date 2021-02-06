#!/data/data/com.termux/files/usr/bin/zsh
#usar zsh shell para que funcione
clear
num=1
core2(){
  archivo=$(ls|wc -l)
  if [ $num -le $archivo ];
  then
  a=$(ls -c|awk NR==$num)
  c=$(setterm --foreground cyan)
  cb=$(setterm --foreground white)
  r=$(setterm --foreground yellow)
  

  if [ -d "$a" ]
  then
   setterm --foreground yellow
   carpeta="Es Un Directorio"
   echo $carpeta
   i=$(echo $a)
  fi
  
  setterm --foreground white
  echo 'ARCHIVO NUMERO '$r$num$cb '| '$c'o'$cb 'ABRIR | '$c'x '$cb'SALIR | '$c'b '$cb'BORRAR'
  setterm --foreground green
  t=$(du -sh $a|awk '{print $1}')
  echo $a $cb' TAMAÑO: '$r$t 
  
  
  
  let num=$num+1
  else
  setterm --foreground white
  echo SON TODOS LOS ARCHIVOS SALIENDO 😎
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
  if [ "$b" = c ];
  then
  cd $a
  num=1
  fi
  if [ "$b" = a ];
  then
  cd ..
  num=1
  fi
  core2
  
  
}

core2


