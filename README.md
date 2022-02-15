# BT-wifi-autologin-sh
## Description
 Got inspriation from github/reddit but i need something to ping to the public servers to test internet connection whilst keeping the pings not a Dos!

## How does it work?
- Login via wget POST data
- Clear a tbblogin file creation for relogins
- One of the main aim for this was built was for pinging server for checking for connection to internet. 
- If not connected then another function turns wifi nic on and off like a physical on/off, this helps to re-login.  

## How does it run?  
Only runs in sudo (SUPERUSER)

		wget https://github.com/MukeshBalaSundar/BT-wifi-autologin-sh#autologin.sh
		sudo cp autologin.sh /usr/login/sbin/
		sudo autologin.sh

## Where is should be located for functionality?  
   File directory (/usr/local/sbin). 

## Permissons  
   chmod 700 = -rwx------

