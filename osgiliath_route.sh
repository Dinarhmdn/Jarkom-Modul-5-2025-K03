#!/bin/bash
echo "Konfigurasi Routing & NAT Osgiliath..."

# 1. Aktifkan IP Forwarding
sysctl -w net.ipv4.ip_forward=1

# 2. Hapus rule lama (Opsional, agar bersih)
# ip route flush table main # Hati-hati jika pakai SSH, ini bisa memutus koneksi
# iptables -t nat -F

# 3. Routing Arah KIRI (Via Moria 10.65.0.10)
echo "Menambahkan Rute Kiri..."
ip route add 10.65.0.64/26 via 10.65.0.10 dev eth2 2>/dev/null
ip route add 10.65.0.32/29 via 10.65.0.10 dev eth2 2>/dev/null
ip route add 10.65.0.40/29 via 10.65.0.10 dev eth2 2>/dev/null
ip route add 10.65.0.20/30 via 10.65.0.10 dev eth2 2>/dev/null

# 4. Routing Arah TENGAH (Via Rivendell 10.65.0.18)
echo "Menambahkan Rute Tengah..."
ip route add 10.65.0.24/30 via 10.65.0.18 dev eth1 2>/dev/null

# 5. Routing Arah KANAN (Via Minastir 10.65.0.6)
echo "Menambahkan Rute Kanan..."
ip route add 10.65.1.0/24 via 10.65.0.6 dev eth3 2>/dev/null
ip route add 10.65.0.12/30 via 10.65.0.6 dev eth3 2>/dev/null
ip route add 10.65.0.48/30 via 10.65.0.6 dev eth3 2>/dev/null
ip route add 10.65.0.52/30 via 10.65.0.6 dev eth3 2>/dev/null
ip route add 10.65.0.128/25 via 10.65.0.6 dev eth3 2>/dev/null

echo "Selesai! Cek dengan 'ip route' "
