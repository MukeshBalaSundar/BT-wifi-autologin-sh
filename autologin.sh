#!/bin/bash

# important!! find and replace terms. EMAIL, PASSWORD and NIC

EMAIL=<YOUR EMAIL for BT WIFI>
PASSWORD=<YOUR PASSWORD for BT WIFI>
NIC=<YOUR NETWORK CARD CONNECTED TO BT WIFI/FON(Open Network)>

function cleanupfin {
	echo "Removing temp file <tbbLogon>...."
	rm -r tbbLogon*
	echo "Completed"
	echo ''
	echo "Captured Ctrl+c....closing"
}


function pkkloss() {
	
	RandomServ
	local pkkLloss="$( ping -W 1 -c 1 ${DNServers[$valTemp]} | awk '{print $6}' | grep "100%\|0%" )"
	echo "Pinging to IP: ${DNServers[$valTemp]}"
	local timeis="$( date +%T )"
	
	if [ "$pkkLloss" = "0%" ]
	then
	echo "@ TIME - $timeis: $pkkLloss Packet Loss --> LOGGED IN"
		
	elif [ "$pkLoss" = "100%" ]
	then
	echo "@ TIME - $timeis: $pkkLloss Packet Loss --> NOT LOGGED IN"

	else
	echo "NOT 0% OR 100%...Try the script again for 0 or 100% Packet Loss!"
	echo "Because for First time server connection can cause first few packets to get lost"
	fi

}



function RandomServ {
	
	valTemp=$(($RANDOM % ${#DNServers[@]}))
}



DNServers=("1.1.1.1" "1.0.0.1" "9.9.9.9" "149.112.112.112" "208.67.222.222" "208.67.220.220" "8.26.56.26" "8.20.247.20" "8.8.8.8")

echo "This is Btwifi AutoLogin script"
pkkloss

trap cleanupfin EXIT


while :
do

  sleep 1
  RandomServ
  pkLoss="$( ping -W 1 -c 1 ${DNServers[$valTemp]} | awk '{print $6}' | grep "100%\|0%" )"
  echo "Pinging to IP: ${DNServers[$valTemp]}"
  if [ "$pkLoss" = "0%" ]
  then

    continue
  elif [ "$pkLoss" = "100%" ]
  then
    
    timeispk="$( date +%T )"
    echo "@ TIME - $timeispk: $pkLoss Packet Loss --> NOT LOGGED IN"

    wget -q --no-cache --post-data "username=$EMAIL&password=$PASSWORD" https://www.btwifi.com:8443/tbbLogon
    
    
     
    pkkloss
    continue
  else
    echo "Error trying again..."
    
    
    sudo ifconfig $NIC down
    echo "Wifi down"
    sleep 2
    sudo ifconfig $NIC up
    sleep 5
    echo "Wifi up"
    continue
  fi
done




