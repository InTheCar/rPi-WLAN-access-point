sudo cp /etc/hostapd/wifiap_WEP /etc/hostapd/hostapd.conf
sudo systemctrl stop hostapd
sudo systemctrl start hostapd
