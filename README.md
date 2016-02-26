# non-free-Flash-updater
a simple Script for automatic update of the non-free Flash pluging for Debian (and I guess other Linux OSes)

Script Name: Non-free-Flash-updater.sh
author: Florian Kühne
date: 18.01.2016

# purpose of script
###  autoupdate flashplayer-nonfree upon start
 
 checks if version installed is not equal than 
 the one that is avaiable (what a maniac idea).
 Because of this every major update should be also processed and updated (worked at least so far)
 
# How to install
 make sure script is put in some accessable location and marked as excecutable:
### chmod +x non-free-Flash-updater.sh
 put link to scriptfile into /etc/rc.local (or where ever you want it to be started from - e.g. cron ? fine)
### sudo nano /etc/rc.local  and paste link to the file

# Start it manually 
 no prob. just make sure you have admin rights 
### sudo ./non-free-Flash-updater.sh
 else it will fail and complain horrobly because it doesen't check if it got sufficent permissions.
