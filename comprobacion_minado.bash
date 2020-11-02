#!/bin/bash
#comprobacion_minado.bash by AitorB16
t1=$(cat $1) #primer fichero

hexa=$(cat $2 | tail -n 1 | cut -c 1-8) #parte hexa del fichero 1
gr=$(cat $2 | tail -n 1 | cut -c 10-)
echo $(cat $2 | tail -n 1 )
t2_rows=$(cat $2 | wc -l)
t2_rows=$(($t2_rows-1))
t2=$(cat $2 | head -n $t2_rows) #fichero 2 sin la parte en hexa

if [ "$t2" == "$t1" ]; then #comprobar contenido de los dos ficheros sea el mismo
    if [ "$(cat $2 | md5sum | cut -c 1)" == "0" ]; then #comprobar que el hash empiece por 0
        if [ "$(echo $hexa | wc -c)" == "9" -a "$(expr $hexa : '[0-9a-fA-F]*' )" == "8" ]; then #comprobar que tengamos 8 caracteres en hexa usando regex
            if [ "$gr" == "G010314" ]; then
                echo "todo correcto"
            else
                echo "El grupo introducido no es G010314"
            fi
        else
            echo "falso, no esta en hexadecimal"
        fi
    else
        echo "falso, el resumen MD5 no empieza por 0"
    fi
else
    echo "falso, los documentos no tienen el mismo contenido"
fi
