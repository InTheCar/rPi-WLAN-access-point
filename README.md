# rPi-WLAN-access-point
My target is not to have a new access point. I want to understand the termologie and especilly the hostapd.
If you want to use it, please take a better password than me.

Using a rPi which is connected via ethernet to the internet as a WLAN access point.

- I'm using a rPi4
- for the os I choosed UBUNTU server 22.04.5 LTS.
- dnsmasq is used for a DHCP and DNS
- hostapd for the configuration of the access point
- networkd is used
- NetworkManager is not installed

#### Here you can find the manual for installation:
https://github.com/InTheCar/rPi-WLAN-access-point/tree/main/docs



The password for the access points is:

wifi

The SSIDs are following this syntax:

wifi_[encryption]

wifi_OPEN -> open access point

wifi_WEP  -> uses WEP




## hostapd config file
### location
the file can be found here after installation:
```
/etc/hostapd/hostapd.conf
```
### hostapd.conf examples
#### hostapd.conf for open WiFi
#### hostapd for open WEP

### hostapd.conf parameters







