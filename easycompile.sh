#!/bin/bash

fileName=$1

afficherRouge () {
    echo -e "\e[31m$1 \e[0m"
}

afficherVert () {
    echo -e "\e[32m$1 \e[0m"
}

if [ $# -eq 0 ]
    then 
        afficherRouge "Vous devez entrer un nom de fichier comme argument de commande."
        exit
    fi

if [[ $fileName == *.c ]]
    then
        fileName=${fileName::-2}
    fi


if ! [[ -f "$fileName.c" ]]
    then
        afficherRouge "Ce fichier n'existe pas dans votre répértoire."
        exit 
    fi

gcc -Wall -Wextra -std=c99 -Wpedantic -g -fsanitize=address,undefined \
    "$@" -o "$fileName"

if ! [ $? -eq 0 ]
    then
        afficherRouge "Echec de la compilation"
        exit
    fi

afficherVert "Compilation terminée, pour lancer le programme \
taper \"./$fileName\" dans votre terminal."


