#!/bin/bash

fileName=$1

if [ $# -eq 0 ]
    then 
        echo "Vous devez entrer un nom de fichier comme argument de commande."
        exit
    fi

if [[ $fileName == *.c ]]
    then
        fileName=${fileName::-2}
    fi


if ! [[ -f "$fileName.c" ]]
    then
        echo "Ce fichier n'existe pas dans votre répértoire."
        exit 
    fi

gcc -Wall -Wextra -std=c99 -Wpedantic -g -fsanitize=address,undefined \
$fileName.c -o $fileName

if ! [ $? -eq 0 ]
    then
        echo -e "\e[31m" # permet d afficher le texte en rouge
        echo -e "Echec de la compilation"
        exit
    fi

echo -e "\e[32m"
echo -e "Compilation terminée, pour lancer le programme \
taper \"./$fileName\" dans votre terminal."


echo -e "\e[0m"
