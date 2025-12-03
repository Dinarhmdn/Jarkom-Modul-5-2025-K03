#!/bin/bash
echo "Menerapkan Port Scan Detector di Minastir..."

IP_PALANTIR="10.65.0.50"
NET_ELENDIL="10.65.1.0/24"

# Hapus aturan lama & chain user
iptables -F
iptables -X PORT_SCAN 2>/dev/null

# --- SOAL: Deteksi Port Scan (>15 port dalam 20 detik) ---

# 1. Buat Chain Logging
iptables -N PORT_SCAN
iptables -A PORT_SCAN -j LOG --log-prefix "PORT_SCAN_DETECTED: " --log-level 4
iptables -A PORT_SCAN -j DROP

# 2. Rule Deteksi (Input dari arah Elendil ke Palantir)
iptables -A FORWARD -s $NET_ELENDIL -d $IP_PALANTIR -m recent --name PS --update --seconds 20 --hitcount 15 -j PORT_SCAN
iptables -A FORWARD -s $NET_ELENDIL -d $IP_PALANTIR -m recent --name PS --set -j ACCEPT

echo "Selesai. Cek log dengan 'dmesg' atau '/var/log/kern.log'."

