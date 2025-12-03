#!/bin/bash
echo "Konfigurasi Routing Minastir..."

# 1. Forwarding
sysctl -w net.ipv4.ip_forward=1

# 2. Rute ke Bawah (Anak-anak Pelargir)
# Mengarah ke Gateway Pelargir (10.65.0.14)
ip route add 10.65.0.48/30 via 10.65.0.14 dev eth2 2>/dev/null
ip route add 10.65.0.52/30 via 10.65.0.14 dev eth2 2>/dev/null
ip route add 10.65.0.128/25 via 10.65.0.14 dev eth2 2>/dev/null

# 3. Gateway ke Atas (Osgiliath)
ip route add default via 10.65.0.5 2>/dev/null

echo "Minastir Siap."
