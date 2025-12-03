#!/bin/bash
apt-get update && apt-get install isc-dhcp-relay -y
# Config: Server=Vilya, Interfaces=Semua
sed -i 's/SERVERS=""/SERVERS="10.65.0.26"/' /etc/default/isc-dhcp-relay
sed -i 's/INTERFACES=""/INTERFACES="eth0 eth1 eth2"/' /etc/default/isc-dhcp-relay
# Aktifkan IP Forwarding
sysctl -w net.ipv4.ip_forward=1
service isc-dhcp-relay restart
