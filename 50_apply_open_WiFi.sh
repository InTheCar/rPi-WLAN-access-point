sudo rm /etc/netplan/51-*
sudo cp ./conf/netplan/51-configure_open.yaml /etc/netplan/
sudo chmod 600 /etc/netplan/*
sudo netplan generate
sudo netplan apply
