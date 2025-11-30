#!/bin/bash
# /root/setup-dhcp.sh

apt-get update
apt-get install isc-dhcp-server -y

echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server

cat > /etc/dhcp/dhcpd.conf <<EOF
# Subnet untuk Vilya sendiri (A8 atau subnet Switch1)
subnet 10.65.0.24 netmask 255.255.255.252 {
}

# A5 - Elendil & Isildur (200 + 30 host)
subnet 10.65.1.0 netmask 255.255.255.0 {
    range 10.65.1.2 10.65.1.254;
    option routers 10.65.1.1;
    option broadcast-address 10.65.1.255;
    option domain-name-servers 10.65.0.29;
    default-lease-time 600;
    max-lease-time 7200;
}

# A6 - Gilgalad (100 host)
subnet 10.65.0.128 netmask 255.255.255.128 {
    range 10.65.0.130 10.65.0.190;
    option routers 10.65.0.129;
    option broadcast-address 10.65.0.255;
    option domain-name-servers 10.65.0.29;
    default-lease-time 600;
    max-lease-time 7200;
}

# A6 - Cirdan (20 host) - bagian dari A6 atau pisah?
# Jika di subnet berbeda, tambahkan config terpisah

# A11 - Durin (50 host)
subnet 10.65.0.64 netmask 255.255.255.192 {
    range 10.65.0.66 10.65.0.126;
    option routers 10.65.0.65;
    option broadcast-address 10.65.0.127;
    option domain-name-servers 10.65.0.29;
    default-lease-time 600;
    max-lease-time 7200;
}

# A12 - Khamul (5 host)
subnet 10.65.0.32 netmask 255.255.255.248 {
    range 10.65.0.34 10.65.0.38;
    option routers 10.65.0.33;
    option broadcast-address 10.65.0.39;
    option domain-name-servers 10.65.0.29;
    default-lease-time 600;
    max-lease-time 7200;
}
EOF

service isc-dhcp-server restart
