# non-free-Flash-updater
a simple Script for automatic update of the non-free Flash pluging for Debian (and I guess other Linux OSes)

Script Name: Non-free-Flash-updater.sh
author: Florian Kühne
date: 18.01.2016

# purpose of script
###  autoupdate flashplayer-nonfree upon login
 
 checks if version installed is not equal than 
 the one that is avaiable (what a maniac idea).
 Because of this every major update should be also processed and updated
 
# How to install
 make sure script (this file) is marked as excecutable:
### chmod +x non-free-Flash-updater.sh
 put link to scriptfile into /etc/rc.local
### sudo nano /etc/rc.local  and paste link to the file
