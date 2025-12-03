#!/bin/bash
echo "Konfigurasi Routing Pelargir..."

# 1. Forwarding
sysctl -w net.ipv4.ip_forward=1

# 2. Rute ke Bawah (Anak-anak AnduinBanks)
# Mengarah ke Gateway AnduinBanks yang BARU (10.65.0.54)
ip route add 10.65.0.128/25 via 10.65.0.54 dev eth1 2>/dev/null

# 3. Gateway ke Atas (Minastir)
ip route add default via 10.65.0.13 2>/dev/null

echo "Pelargir Siap."
