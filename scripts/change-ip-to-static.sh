#!/bin/bash

# The network interface that you want to set a static IP for
INTERFACE="eth0"

# The static IP that you want to set
#IPADDR="172.31.26.52"

# The network mask
NETMASK="24"

# The gateway IP
#GATEWAY="192.1.1.1"

# The DNS server IP
DNS="8.8.8.8"

#!/bin/bash

if [ $1="desktop" ]; then
    # Statements to execute if condition1 is true
    if [ $2='web1' ]; then
        # Statements to execute if condition2 is also true
        IPADDR="192.168.1.52"
        GATEWAY="192.1.1.1"
    elif [ $2='web2' ]; then
        # Statements to execute if condition2 is also true
        IPADDR="192.168.1.53"
        GATEWAY="192.1.1.1"
    elif [ $2='web3' ]; then
        # Statements to execute if condition2 is also true
        IPADDR="192.168.1.54"
        GATEWAY="192.1.1.1"
    elif [ $2='db' ]; then
        # Statements to execute if condition2 is also true
        IPADDR="192.168.1.55"
        GATEWAY="192.1.1.1"
    elif [ $2='lb' ]; then
        # Statements to execute if condition2 is also true
        IPADDR="192.168.1.56"
        GATEWAY="192.1.1.1"
    elif [ $2='fleet' ]; then
        # Statements to execute if condition2 is also true
        IPADDR="192.168.1.57"
        GATEWAY="192.1.1.1"
    fi
elif [ $1="laptop" ]
    # Statements to execute if condition1 is true
    if [ $2='web1' ]; then
        # Statements to execute if condition2 is also true
        IPADDR="192.168.8.52"
        GATEWAY="192.1.8.1"
    elif [ $2='web2' ]; then
        # Statements to execute if condition2 is also true
        IPADDR="192.168.8.53"
        GATEWAY="192.1.8.1"
    elif [ $2='web3' ]; then
        # Statements to execute if condition2 is also true
        IPADDR="192.168.8.54"
        GATEWAY="192.1.8.1"
    elif [ $2='db' ]; then
        # Statements to execute if condition2 is also true
        IPADDR="192.168.8.55"
        GATEWAY="192.1.8.1"
    elif [ $2='lb' ]; then
        # Statements to execute if condition2 is also true
        IPADDR="192.168.8.56"
        GATEWAY="192.1.8.1"
    elif [ $2='fleet' ]; then
        # Statements to execute if condition2 is also true
        IPADDR="192.168.8.57"
        GATEWAY="192.1.8.1"
    # Statements to execute if condition1 is false
fi


# Copy the current config to vagrant home
sudo cp /etc/netplan/01-netcfg.yaml /home/vagrant/01-netcfg.yaml
# Write the configuration to the Netplan configuration file
sudo echo "network:" > /etc/netplan/01-netcfg.yaml
sudo echo "  version: 2" >> /etc/netplan/01-netcfg.yaml
sudo echo "  renderer: networkd" >> /etc/netplan/01-netcfg.yaml
sudo echo "  ethernets:" >> /etc/netplan/01-netcfg.yaml
sudo echo "    $INTERFACE:" >> /etc/netplan/01-netcfg.yaml
sudo echo "      dhcp4: no" >> /etc/netplan/01-netcfg.yaml
sudo echo "      addresses: [$IPADDR/$NETMASK]" >> /etc/netplan/01-netcfg.yaml
sudo echo "      gateway4: $GATEWAY" >> /etc/netplan/01-netcfg.yaml
sudo echo "      nameservers:" >> /etc/netplan/01-netcfg.yaml
sudo echo "        addresses: [$DNS]" >> /etc/netplan/01-netcfg.yaml

# Apply the changes
sudo netplan apply