# BT-wifi-autologin-sh
## Warning  
The issue with the autologin script is that username and password is stored in a file in a readable format (within the script file), so make sure that the file is not shared without REMOVING your password.  

## Description  
Got inspiration from github/reddit but I need public servers to ping for testing internet connection whilst keeping the pings low enough for them* to handle. 

*Them means the public cloud for testing but this script has 9 public servers to ping and test internet connection. They are selected in random.

## How does it work?
- Login via wget POST data
- Clear the tbblogin file created from re-logins
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
