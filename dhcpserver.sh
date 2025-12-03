#!/bin/bash
echo "=== INSTALLASI DHCP SERVER (VILYA) ==="

# 1. Update & Install
apt-get update
apt-get install isc-dhcp-server -y

# 2. Konfigurasi Interface (eth0)
echo "Mengatur Interface..."
cat > /etc/default/isc-dhcp-server <<EOF
INTERFACESv4="eth0"
EOF

# 3. Konfigurasi Subnet (dhcpd.conf)
echo "Menulis Konfigurasi Subnet..."
cat > /etc/dhcp/dhcpd.conf <<EOF
# Global Config
default-lease-time 600;
max-lease-time 7200;
option domain-name-servers 10.65.0.27; # IP Narya

# A7: Subnet Vilya Sendiri (WAJIB ADA)
subnet 10.65.0.24 netmask 255.255.255.248 {
}

# A11: DURIN (Gateway: Wilderland eth1)
subnet 10.65.0.64 netmask 255.255.255.192 {
    range 10.65.0.66 10.65.0.126;
    option routers 10.65.0.65;
}

# A12: KHAMUL (Gateway: Wilderland eth2)
subnet 10.65.0.32 netmask 255.255.255.248 {
    range 10.65.0.34 10.65.0.38;
    option routers 10.65.0.33;
}

# A5: ELENDIL & ISILDUR (Gateway: Minastir eth1)
subnet 10.65.1.0 netmask 255.255.255.0 {
    range 10.65.1.2 10.65.1.254;
    option routers 10.65.1.1;
}

# A6: GILGALAD & CIRDAN (Gateway: AnduinBanks eth1)
subnet 10.65.0.128 netmask 255.255.255.128 {
    range 10.65.0.130 10.65.0.254;
    option routers 10.65.0.129;
}
EOF

# 4. Restart Service
echo "Merestart Service..."
service isc-dhcp-server restart
service isc-dhcp-server status | grep "Active"
