# Definisi Variabel IP (Biar gampang baca)
IP_IRON="10.65.0.42"

# 1. Whitelist Faksi & Waktu (Sabtu-Minggu)
# Durin
iptables -A FORWARD -d $IP_IRON -s 10.65.0.64/26 -m time --weekdays Sat,Sun -j ACCEPT
# Khamul
iptables -A FORWARD -d $IP_IRON -s 10.65.0.32/29 -m time --weekdays Sat,Sun -j ACCEPT
# Elendil & Isildur
iptables -A FORWARD -d $IP_IRON -s 10.65.1.0/24 -m time --weekdays Sat,Sun -j ACCEPT

# 2. Blokir sisanya (Atau yang akses di hari biasa)
iptables -A FORWARD -d $IP_IRON -p tcp --dport 80 -j DROP
