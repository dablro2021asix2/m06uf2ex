#!/bin/bash
#
if [ $EUID -ne 0 ]
then
	echo "This script must be run as root"
	exit 1
fi

clear
echo "Escriu el nom d'un usuari del sistema: "
read Usuari

regex="'awk -F ":" '{print $1}' /etc/passwd'"

Comprobacio='sudo cat /etc/passwd | grep "$Usuari"'

if [[ $Usuari =~ $regex ]]
then
	 awk -F ":" '{print $3}' /etc/passwd
	exit 0
else
	echo "Error. Aquest usuari no existeix"
fi
