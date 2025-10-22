# rPi-WLAN-access-point
## known problems open points
- testing if it's working like expected
- improvement of documentation
- try to remove the packadge "openvswitch-switch-dpdk". I think it's not needed.

## My target
My target is not to have a access point for testing. I want to understand the termologie and especilly the hostapd 
service.
If you want to use it, please use a better password than me.
Using a rPi which is connected via ethernet to the internet and acting as a WLAN access point.
For me the main usage is to sniff on the airinterface with my sniffer:
https://github.com/InTheCar/WiFi-sniffer


## lesson learned
- wpa_supplicant is needed only if the rPi is acting as a client. So I don't need it.
- hostapd is used if the rPi is acting as an access point
- If you make changes in the hostapd.conf use a systemctl stop start and not a reload. It's not the same.
- 


## HW/SW used
- **rPi4**
- For the **OS** I choosed **UBUNTU server 22.04.5 LTS**.
- **dnsmasq** is used for a DHCP and DNS
- **hostapd** for the configuration of the access point
- **networkd** is used
- **NetworkManager** is not installed

## Here you can find the manual for installation:
I made a .rtf document
https://github.com/InTheCar/rPi-WLAN-access-point/tree/main/docs

## user used
user        : wifi
password    : wifi

## set a wifi "security"
During the installtion you will clone this peposetory. There you find a script to change 
the configuration of the access point:

~/[repository rPi-WLAN-access-point]/**setWiFi.sh**

setWiFi.sh PATTERN [OPTIONS]

**PATTERN:**

  open : an open access point will be configured

   wep : an WEP (Wired Equivalent Privacy) access point will be configured

   wpa : an WPA (Wi-Fi Protected Access) access point will be configured


**OPTIONS:**

    -d : debug, more output for trouble shooting
   
## The Configurations
### open
password: none

ssid        : **wifi_OPEN**

configuration file: `wifiap_OPEN`

configuration file content:
```
# Wi-Fi Access Point OPEN

# interface and driver
interface=wlan0
driver=nl80211

# hostap_cli interface
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0

# WiFi configuration common
ssid=wifi_OPEN
channel=1
hw_mode=g
country_code=DE

# MAC address -based authentication / Hidden SSID
macaddr_acl=0
ignore_broadcast_ssid=0

# WiFi encryption
# it's open
```
### WEP
password    : **wifi1**

ssid        : **wifi_WEP**

configuration file: `wifiap_WEP`

configuration file content:
```
# Wi-Fi Access Point WEP

# interface and driver
interface=wlan0
driver=nl80211

# hostap_cli interface
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0

# WiFi configuration
ssid=wifi_WEP
channel=1
hw_mode=g
country_code=DE

# MAC address -based authentication / Hidden SSID
macaddr_acl=0
ignore_broadcast_ssid=0

# WiFi encryption
eap_server=0
wep_key1="wifi1"
wep_key_len_broadcast=5
wep_key_len_unicast=5
wep_rekey_period=300
```
### WPA
password: wifi1234

ssid        : **wifi_WPA**

configuration file: `wifiap_WPA`

configuration file content:
```
# Wi-Fi Access Point WPA

# interface and driver
interface=wlan0
driver=nl80211

# hostap_cli interface
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0

# WiFi configuration
ssid=wifi_WPA
channel=1
hw_mode=g
country_code=DE

# MAC address -based authentication / Hidden SSID
macaddr_acl=0
ignore_broadcast_ssid=0

# WiFi encryption
wpa=1
wpa_key_mgmt=WPA-PSK
wpa_passphrase=wifi1234
```
### WPA2
password: wifi1234

ssid        : **wifi_WPA2**

configuration file: `wifiap_WPA2`

configuration file:
```
# Wi-Fi Access Point WPA2

# interface and driver
interface=wlan0
driver=nl80211

# hostap_cli interface
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0

# WiFi configuration
ssid=wifi_WPA2
channel=1
hw_mode=g
country_code=DE

# MAC address -based authentication / Hidden SSID
macaddr_acl=0
ignore_broadcast_ssid=0

# WiFi encryption
wpa=2
wpa_key_mgmt=WPA-PSK
wpa_passphrase=wifi1234
```


########################################################################






## hostapd config file
### location
the file can be found here after installation:
```
/etc/hostapd/hostapd.conf
```
### hostapd.conf examples
#### hostapd.conf for open WiFi

```
# Wi-Fi AP OPEN

# interface and driver
interface=wlan0
driver=none

# cotrol interfaface for hostapd_cli
#  
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0

# WiFi configuration
ssid=wifi_OPEN
channel=1
hw_mode=g
country_code=DE

# WiFi encryption
macaddr_acl=0
ignore_broadcast_ssid=0
```

#### hostapd for open WEP

### hostapd.conf parameters
#### interface
#### WPA WPA2 parameter (copied from configuration which is delivered with hostapd)
The parameter wpa is a bit field:
bit0 = **WPA**
bit1 = IEEE 802.11i/RSN (**WPA2**) (dot11RSNAEnabled)

wpa=1 #WPA only
wpa=2 #WPA2 only
wpa=3 #WPA + WPA2

## collection

/usr/share/doc/hostapd/examples/hostapd. conf








