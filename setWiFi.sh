#!/bin/bash
debug=0
selected=""
StatusHostapd=1

for arg in "$@"
do
	if [ "$arg" == "-d" ];then
		debug=1
		echo "debug set"
	elif [ "$arg" == "open" ];then
		selected="wifiap_OPEN"
		echo "wifiap_OPEN configuration will be applied"
		echo "password: no password"
	elif [ "$arg" == "wep" ];then
		selected="wifiap_WEP"
		echo "wifiap_WEP configuration will be applied"
		echo "password: wifi1"
	elif [ "$arg" == "wpa" ];then
		selected="wifiap_WPA"
		echo "wifiap_WPA configuration will be applied"
		echo "password: wifi1234"
	elif [ "$arg" == "wpa2" ];then
		selected="wifiap_WPA2"
		echo "wifiap_WPA2 configuration will be applied"
		echo "password: wifi1234"
	fi
done
if [ "$selected" == "" ];then
	echo
	echo --------------------------------------------------------------------------
	echo "usage"
	echo "setWiFi PATTERN [OPTIONS]"
	echo "PATTERN:"
	echo "  open : an open access point will be configured"
	echo "   wep : an WEP (Wired Equivalent Privacy) access point will be configured"
	echo "   wpa : an WPA (Wi-Fi Protected Access) access point will be configured"
	echo "OPTIONS:"
	echo "  -d : debug, more output for trouble shooting"
	echo --------------------------------------------------------------------------
	echo
	exit
fi

sudo systemctl stop hostapd.service

while [ $StatusHostapd -ne 1 ]
do
	StatusHostapd=eval systemctl is-active --quiet hostapd.service
	echo "hostapd not stoped"
done

sudo cp --verbose "/etc/hostapd/$selected" /etc/hostapd/hostapd.conf
sync
if [ "$debug" -ne 0 ];then
	systemctl show hostapd.service -p NRestarts
fi
	sudo systemctl start hostapd.service
if [ "$debug" -ne 0 ];then
	journalctl -n 10 -u hostapd.service --since "1min ago"
	systemctl show hostapd.service -p ActiveState
	systemctl show hostapd.service -p NRestarts
fi

