  GNU nano 8.4                                 /root/moria_route.sh                                           #!/bin/bash
echo "Konfigurasi Routing Moria..."

# 1. Forwarding
sysctl -w net.ipv4.ip_forward=1

# 2. Rute ke Bawah (Anak-anak Wilderland)
ip route add 10.65.0.64/26 via 10.65.0.22 dev eth2 2>/dev/null
ip route add 10.65.0.32/29 via 10.65.0.22 dev eth2 2>/dev/null

# 3. Gateway ke Atas (Osgiliath)
ip route add default via 10.65.0.9 2>/dev/null

echo "Moria Siap."
