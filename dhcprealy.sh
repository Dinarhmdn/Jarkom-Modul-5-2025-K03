#!/bin/bash
# /root/setup-relay.sh

apt-get update
apt-get install isc-dhcp-relay -y

# IP Vilya di subnet Switch1 (cari dari tabel)
cat > /etc/default/isc-dhcp-relay <<EOF
SERVERS="10.65.0.25"
INTERFACES="eth0 eth1 eth2"
OPTIONS=""
EOF

service isc-dhcp-relay restart
