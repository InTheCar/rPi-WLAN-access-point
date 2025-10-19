sudo rm /etc/netplan/51-*
sudo cp ./conf/netplan/51-configure_WEP.yaml /etc/netplan/
sudo chmod 600 /etc/netplan/*
sudo netplan generate
sudo netplan apply
