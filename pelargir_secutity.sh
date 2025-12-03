#!/bin/bash
echo "Menerapkan Security Rules di Pelargir..."

# Variabel
IP_PALANTIR="10.65.0.50"
NET_ELF="10.65.0.128/25"   # Gilgalad & Cirdan
NET_MANUSIA="10.65.1.0/24" # Elendil & Isildur

# Hapus aturan lama
iptables -F

# --- SOAL: Akses Jam Kerja Ras ---
# Elf: 07.00 - 15.00
iptables -A FORWARD -d $IP_PALANTIR -s $NET_ELF -m time --timestart 07:00 --timestop 15:00 -j ACCEPT

# Manusia: 17.00 - 23.00
iptables -A FORWARD -d $IP_PALANTIR -s $NET_MANUSIA -m time --timestart 17:00 --timestop 23:00 -j ACCEPT

# Blokir akses Web (Port 80) di luar jam tersebut
iptables -A FORWARD -d $IP_PALANTIR -p tcp --dport 80 -j DROP

echo "Selesai. Pastikan jam server benar."
