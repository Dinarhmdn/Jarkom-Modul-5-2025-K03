#!/bin/bash
echo "Menerapkan Security Rules di Rivendell..."

# Variabel IP (Sesuai Topologi)
IP_VILYA="10.65.0.26"
IP_NARYA="10.65.0.27"

# Hapus aturan lama (Flush)
iptables -F

# --- SOAL: Vilya tidak boleh di-PING orang lain ---
# Blokir ICMP Echo Request yang menuju Vilya
iptables -A FORWARD -d $IP_VILYA -p icmp --icmp-type echo-request -j DROP

# --- SOAL: Hanya Vilya yang boleh akses DNS Narya ---
# 1. Whitelist: Izinkan Vilya ke Narya (UDP/TCP 53)
iptables -A FORWARD -s $IP_VILYA -d $IP_NARYA -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -s $IP_VILYA -d $IP_NARYA -p tcp --dport 53 -j ACCEPT

# 2. Blacklist: Blokir sisanya ke Narya (UDP/TCP 53)
iptables -A FORWARD -d $IP_NARYA -p udp --dport 53 -j DROP
iptables -A FORWARD -d $IP_NARYA -p tcp --dport 53 -j DROP

echo "Selesai. Cek dengan 'iptables -L -v -n'"

