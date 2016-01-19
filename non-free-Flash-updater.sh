#!/bin/bash

# Script Name: Non-free-Flash-updater
# author: Florian Kühne
# date: 18.01.2016

# purpose of script: autoupdate flashplayer-nonfree upon login
# if version installed is not equal than 
# the one that is avaiable (what a maniac idea).
# Because of this every major update should be processed and updated

# How to install
# make sure script (this file) is marked as excecutable
# chmod +x "filename"
# put link to scriptfile into /etc/rc.local

enableErrorOutput="y"  #y/n

if [ $enableErrorOutput = "y" ]
	then
	grep da * 2>> ./errors.log
fi

exec $1 > ./output.log

VER_INST=$(update-flashplugin-nonfree --status | awk 'NR==1 {print $NF }' )
VER_RELEASED=$(update-flashplugin-nonfree --status | awk 'NR==2 {print $NF }' )

#echo "$VER_INST"
#echo "$VER_RELEASED"

#entfernt alle Zahlen der Versionsnummer vor dem letzten Punkt
VER_INST_s=${VER_INST##*.}
VER_RELEASED_s=${VER_RELEASED##*.}
#echo "$VER_RELEASED_s"
#echo "$VER_INST_s"

if [[ $VER_RELEASED_s -eq $VER_INST_s ]]; then
	echo $(date) ": No update avaiable"
else
	update-flashplugin-nonfree --install
	if [[ $(echo $?) -eq 0 ]]; then
		echo $(date) ": update found & installed."
	else
		echo $(date) ": some thing went wrong."
	fi
fi

exit 0
