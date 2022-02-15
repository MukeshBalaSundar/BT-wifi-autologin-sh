# BT-wifi-autologin-sh
## Warning  
The issue with the autologin script is that username and password is stored in a file in a readable format (within the script file), so make sure that the file is not shared without REMOVING your password.  

## Date Created  
July 2021, but uploaded recently.


## Description  
Got inspiration from github/reddit but I need public servers to ping for testing internet connection whilst keeping the pings low enough for them* to handle. 

*Them means the public cloud for testing but this script has 9 public servers to ping and test internet connection. They are selected in random.

IN SCRIPT:
Default;-
important!! find and replace terms. EMAIL, PASSWORD and NIC  
EMAIL=<YOUR_EMAIL_for_BT_WIFI>  
PASSWORD=<YOUR_PASSWORD_for_BT_WIFI>  
NIC=<YOUR_NETWORK_CARD_CONNECTED_TO_BT_WIFI/FON(Open Network)>  

Changes;  
EMAIL=email @ domain.com  
PASSWORD=password123  
NIC=eth0  

## How does it work?
- Login via wget POST data
- Clear the tbblogin file created from re-logins
- One of the main aim for this was built was for pinging server for checking for connection to internet. 
- If not connected then another function turns wifi nic on and off like a physical on/off, this helps to re-login.  

## How does it run (+ permissions, file dir)?  
Only runs in sudo (SUPERUSER)

	wget https://raw.githubusercontent.com/MukeshBalaSundar/BT-wifi-autologin-sh/main/autologin.sh
	sudo cp autologin.sh /usr/login/sbin/
	sudo cd /usr/login/sbin/
	sudo chmod 700 autologin.sh
	sudo autologin.sh

## Where is should be located for functionality?  
File directory (/usr/local/sbin). This is the only place it works for now. Due to sudo rights the clear function (removing tbblogin file) is taken as a function and quits with error on the function. So the best solution is to restrict access to any user or group and bas it only for root user.


