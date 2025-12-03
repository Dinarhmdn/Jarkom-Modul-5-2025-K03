#!/bin/bash
echo "=== INSTALLASI WEB SERVER (IRONHILLS) ==="

# 1. Install Nginx
apt-get update
apt-get install nginx -y

# 2. Buat Konten Web
echo "Welcome to IronHills" > /var/www/html/index.html

# 3. Set DNS ke Narya (Agar siap Misi 2)
echo "nameserver 10.65.0.27" > /etc/resolv.conf

# 4. Restart
service nginx restart
echo "Web Server IronHills Siap."
