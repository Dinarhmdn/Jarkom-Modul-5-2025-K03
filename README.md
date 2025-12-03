<img width="1003" height="690" alt="image" src="https://github.com/user-attachments/assets/a15b49d0-412f-4c0f-bff4-cbedae4975c2" /># Jarkom-Modul-5-2025-K03

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







