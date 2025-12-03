# Subnet
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/user-attachments/assets/cba8956e-4e0a-412c-b62e-0bffdb968378" />

# Pembagian IP - VLSM
<img width="889" height="389" alt="Screenshot 2025-11-27 at 09 11 44" src="https://github.com/user-attachments/assets/184801bc-5eb2-47c3-9caa-121423493b3f" />

# VLSM
<img width="1801" height="1161" alt="Untitled Diagram" src="https://github.com/user-attachments/assets/5da52a94-1267-4d5e-9b6f-49259d36d61e" />

## Misi 1: Memetakan Medan Perang

### Lakukan Routing sesuai dengan pembagian
<img width="889" height="389" alt="Screenshot 2025-11-27 at 09 11 44" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20222737.png" />
<img width="889" height="389" alt="Screenshot 2025-11-27 at 09 11 44" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/Screenshot%202025-12-03%20223833.png" />
<img width="889" height="389" alt="Screenshot 2025-11-27 at 09 11 44" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/Screenshot%202025-12-03%20224106.png" />
<img width="889" height="389" alt="Screenshot 2025-11-27 at 09 11 44" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/Screenshot%202025-12-03%20224206.png" />
<img width="889" height="389" alt="Screenshot 2025-11-27 at 09 11 44" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/Screenshot%202025-12-03%20224339.png" />
<img width="889" height="389" alt="Screenshot 2025-11-27 at 09 11 44" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/Screenshot%202025-12-03%20224454.png" />
<img width="889" height="389" alt="Screenshot 2025-11-27 at 09 11 44" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/Screenshot%202025-12-03%20224637.png" />
<img width="889" height="389" alt="Screenshot 2025-11-27 at 09 11 44" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/Screenshot%202025-12-03%20224719.png" />

### Lakukan tes
ping IP AduinBanks Yng berada di ujung kanan ipnya 10.65.0.54
<img width="889" height="389" alt="Screenshot 2025-11-27 at 09 11 44" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20225814.png">

## Misi 2: Menemukan Jejak Kegelapan (Security Rules)
### Agar jaringan Aliansi bisa terhubung ke luar (Valinor/Internet), konfigurasi routing menggunakan iptables.
 Syarat: Kalian TIDAK DIPERBOLEHKAN menggunakan target MASQUERADE. 
 mengunakan SNAT
 
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20230316.png" />

### Konfigurasi Service → Dikerjakan setelah Misi 2 No. 1:

Vilya sebagai DHCP Server agar perangkat dalam Khamul, Durin, Gilgalad, Elendil, Cirdan, dan Isildur menerima IP otomatis.
AnduinBanks, Rivendell, dan Minastir berfungsi sebagai DHCP Relay.
Narya sebagai DNS Server.
Palantir dan IronHills sebagai Web Server (Apache/Nginx).
Buat index.html berisikan : "Welcome to {hostname}"

#### DHCP server
Vilya sebagai DHCP Server buat script ```/root/dhcpserver.sh```
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20230936.png" />
#### DHCP Relay
AnduinBanks, Rivendell, dan Minastir Buat script ``` /root/dhcprelay.sh```
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20231452.png" />
####  DNS Server.
Narya sebagai DNS Server buat script ```/root/dnsserver.sh```
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20231717.png" />
#### Web Server (Apache/Nginx).
Palantir dan IronHills sebagai Web Server buat script ```/root/webserver.sh```
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20232124.png" />
#### Cek DHCP apkah berhasil
di configurasi gilgalad usudah dhcp dan gilgalad sudah mendapatkan ip juga
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20232547.png" />
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20232621.png" />
#### Tes DNS Server
di Node gilgalad gunakan Nslookup untuk meliaht apakah DNS nya bekerja
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20232706.png" />

##K arena Vilya (DHCP) menyimpan data vital, pastikan tidak ada perangkat lain yang bisa melakukan PING ke Vilya.
Namun, Vilya tetap leluasa dapat mengakses/ping ke seluruh perangkat lain.
```
# Blokir ICMP Echo Request yang menuju Vilya
iptables -A FORWARD -d 10.65.0.26 -p icmp --icmp-type echo-request -j DROP
```
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20233848.png" />
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20233927.png" />


## Agar lokasi pasukan tidak bocor, hanya Vilya yang dapat mengakses Narya (DNS).
Gunakan nc (netcat) untuk memastikan akses port DNS (53) ini.
[Hapus aturan ini setelah pengujian agar internet lancar untuk install paket]

```
# 1. Whitelist: Izinkan Vilya ke Narya (UDP/TCP 53)
iptables -A FORWARD -s $IP_VILYA -d $IP_NARYA -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -s $IP_VILYA -d $IP_NARYA -p tcp --dport 53 -j ACCEPT

# 2. Blacklist: Blokir sisanya ke Narya (UDP/TCP 53)
iptables -A FORWARD -d $IP_NARYA -p udp --dport 53 -j DROP
iptables -A FORWARD -d $IP_NARYA -p tcp --dport 53 -j DROP
```
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20234223.png" />
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20234248.png" />
```
1. Hapus Blokir UDP (Port 53)
Bash
iptables -D FORWARD -d 10.65.0.27 -p udp --dport 53 -j DROP

2. Hapus Blokir TCP (Port 53)
Bash
iptables -D FORWARD -d 10.65.0.27 -p tcp --dport 53 -j DROP
```
##  Aktivitas mencurigakan terdeteksi di IronHills. Berdasarkan dekrit Raja, IronHills hanya boleh diakses pada Akhir Pekan (Sabtu & Minggu).
Akses hanya diizinkan untuk Faksi Kurcaci & Pengkhianat (Durin & Khamul) serta Faksi Manusia (Elendil & Isildur).
Karena hari ini adalah Rabu (Simulasikan waktu server), mereka harusnya tertolak. Gunakan curl untuk membuktikan blokir waktu ini.
```
IP_IRON="10.65.0.42"
# 1. Whitelist Faksi & Waktu (Sabtu-Minggu)
# Durin
iptables -A FORWARD -d $IP_IRON -s 10.65.0.64/26 -m time --weekdays Sat,Sun -j ACCEPT
# Khamul
iptables -A FORWARD -d $IP_IRON -s 10.65.0.32/29 -m time --weekdays Sat,Sun -j ACCEPT
# Elendil & Isildur
iptables -A FORWARD -d $IP_IRON -s 10.65.1.0/24 -m time --weekdays Sat,Sun -j ACCEPT

# 2. Blokir sisanya (Atau yang akses di hari biasa)
iptables -A FORWARD -d $IP_IRON -p tcp --dport 80 -j DRO
```
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20234802.png" />
## Sembari menunggu, pasukan berlatih di server Palantir. Akses dibatasi berdasarkan ras:
Faksi Elf (Gilgalad & Cirdan): Boleh akses jam 07.00 - 15.00.
Faksi Manusia (Elendil & Isildur): Boleh akses jam 17.00 - 23.00.
Gunakan curl untuk memastikan akses sesuai jam.
```
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
```

<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20235418.png" />
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20235301.png" />

## Pasukan Manusia (Elendil) diminta menguji keamanan Palantir. Lakukan simulasi port scan dengan nmap rentang port 1-100.
```
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

```
a. Web server harus memblokir scan port yang melebihi 15 port dalam waktu 20 detik.
b. Penyerang yang terblokir tidak dapat melakukan ping, nc, atau curl ke Palantir.
c. Catat log iptables dengan prefix "PORT_SCAN_DETECTED".
<img width="450" height="403" alt="Screenshot 2025-11-27 at 09 12 03" src="https://github.com/Dinarhmdn/Jarkom-Modul-5-2025-K03/blob/main/img/Screenshot%202025-12-03%20235912.png" />
(agar saat di ping nc atau curl gagal lan=kukan setelah melakukan nmap jangan lebih dari 5 detik )






