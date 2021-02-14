#!/data/data/com.termux/files/usr/bin/zsh
#usar zsh shell para que funcione

num=1
clear
#FUNCION DE COLORES DEL TEXTO
colores(){
  cy=$(setterm --foreground cyan)
  wh=$(setterm --foreground white)
  ye=$(setterm --foreground yellow)
  gr=$(setterm --foreground green)
  re=$(setterm --foreground red)
  
  
  
}


#FUNCION PRINCIPAL
init(){
  n_archivo=$(ls|wc -l)
  archivo=$(ls -c|awk NR==$num)
  t=$(du -sh $archivo|awk '{print $1}')
  if [ -d $archivo ]
  then 
  
  dir="📁  "
  else 
  dir=""
  fi
  
  echo $wh'ARCHIVO NUMERO '$cy$num '| '$cy'o'$wh 'ABRIR | '$cy'x '$wh'SALIR | '$cy'b '$wh'BORRAR'
  
  echo $dir $gr$archivo $ye'     tamaño : '$cy$t 
  
  read accion
  let num=$num+1
  $accion
  init
}

#FUNCION QUE ABRE el archivo
o(){
  
  echo $ye'esta funcion abrira el archivo'
  termux-open $archivo
  
  init
}


#FUNCION QUE ABRE EL DIRECTORIO selecionado
c(){
  echo $cy'esta funcion entrara a la carpeta especificada'
 cd $archivo
 num=1
 init
}


#FUNCION DE SALIDA DEL APP-SCRIPT
x(){
  echo esta funcion sale del escript
  
  exit
  
}

#FUNCION QUE BORRA EL ARCHIVO
a(){
  echo esta funcion regresa un direcctorio
  cd ..
  num=1
  init
}


#FUNCION QUE BORRA EL ARCHIVO seleccionado
b(){
  rm $archivo
  let num=$num-1
  init
  
}

#FUNCION PROMPT QUE PERMITE METER COMANDOS
p(){
  echo esta funcion permite meter comandos y acceder al promt de bash
  read prompt
  $prompt
  init
  
}


#FUNCION QUE PERMITE EDITAR ARCHIVOS
v(){
  vim $archivo
  let num=$num-1
  init
  
  
}


w(){
 echo un pazo atras
 n_archivo=$(ls|wc -l)
  archivo=$(ls -c|awk NR==$num)
  t=$(du -sh $archivo|awk '{print $1}')
  echo 'ARCHIVO NUMERO '$num '| '$cy'o'$wh 'ABRIR | '$cy'x '$wh'SALIR | '$cy'b '$wh'BORRAR'
  
  echo $gr$archivo $ye'     tamaño : '$cy$t
  read accion
  let num=$num-1
  $accion
  w
  
  
}
i(){
  init
  
  
}

#INICIALIZAR ENGINE
colores
init
