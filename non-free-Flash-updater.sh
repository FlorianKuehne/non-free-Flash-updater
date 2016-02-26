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

#UserVars:
enableErrorOutput="n"  #y/n


#Functions
function isOnline {
	ping -q -w 1 -c 1 8.8.8.8 > /dev/null
	#if [[ $(echo $?) -eq 0 ]]; then
		##echo online
		#return 1
	#else
		##echo offline
		#return 0
	#fi
}

# return 0 if update avail. else 1
function checkForUpdate {
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
		#echo -e "nope ...\nnothing here left for us to do.. I'm out."
		echo "nothing here left for us to do.. I'm out."
		return 1
		#exit 0 	#we're done here, but this way it would be ugly as hell
	else
		# not required happens in updatefunction
		#echo $(date) ": Yes update avaiable"
		return 0
	fi
}

function update {	
	update-flashplugin-nonfree --install
	if [[ $(echo $?) -eq 0 ]]; then
		echo $(date) ": update found & succesfull installed."
		return 0
	else
		echo $(date) ": some thing went wrong."
		return 1
	fi
}




#Script
if [ $enableErrorOutput = "y" ]; then 
	grep da * 2>> ./errors.log
fi

#it's beein overwritten on every start
exec $1 > ./output.log

n=0
while :
do
	((n++))
	# if machine is online 
	if  isOnline ; then 
		echo "online"
		#and an update avaiable ?
		if  checkForUpdate ; then
			#yes, then install the fucking thing and quit right away (exit 0 | 1)
			update
			echo
			exit $(echo $?)
		else
			# no, done. 
			echo
			exit 0
		fi
	else
		echo "offline, gonna wait for 120s ..., tryed $n times"
	fi
	sleep 120
done
	

exit 2
