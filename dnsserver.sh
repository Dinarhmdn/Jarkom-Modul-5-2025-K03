#!/bin/bash
echo "=== INSTALLASI DNS SERVER (NARYA) ==="

# 1. Update & Install
apt-get update
apt-get install bind9 -y

# 2. Config Options (Forwarder ke Google)
echo "Mengatur Forwarders..."
cat > /etc/bind/named.conf.options <<EOF
options {
    directory "/var/cache/bind";
    forwarders {
        8.8.8.8;
    };
    allow-query { any; };
    recursion yes;
    dnssec-validation no; # Matikan validasi agar tidak SERVFAIL di GNS3
    listen-on-v6 { any; };
};
EOF

# 3. Config Local Zone
echo "Mendaftarkan Zone..."
cat > /etc/bind/named.conf.local <<EOF
zone "aliansi.com" {
    type master;
    file "/etc/bind/db.aliansi";
};
EOF

# 4. Config Database (IP Revisi)
echo "Membuat Database Domain..."
cat > /etc/bind/db.aliansi <<EOF
;
\$TTL    604800
@       IN      SOA     aliansi.com. root.aliansi.com. (
                     2      ; Serial
                604800      ; Refresh
                 86400      ; Retry
               2419200      ; Expire
                604800 )    ; Negative Cache TTL
;
@       IN      NS      aliansi.com.
@       IN      A       10.65.0.27

; Daftar A Records
ns          IN      A       10.65.0.27
palantir    IN      A       10.65.0.50
ironhills   IN      A       10.65.0.42
www         IN      CNAME   palantir
EOF

# 5. Restart Service (Coba bind9 atau named)
echo "Merestart Service..."
service bind9 restart 2>/dev/null || service named restart
echo "Selesai. Cek dengan 'nslookup palantir.aliansi.com 127.0.0.1'"
