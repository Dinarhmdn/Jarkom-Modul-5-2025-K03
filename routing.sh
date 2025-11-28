#!/bin/bash
# /root/routing.sh

# Via Minastir (A1)
route add -net 10.65.1.0 netmask 255.255.255.0 gw 10.65.0.6        # A5 - Elendil & Isildur
route add -net 10.65.0.8 netmask 255.255.255.252 gw 10.65.0.6      # A2
route add -net 10.65.0.12 netmask 255.255.255.252 gw 10.65.0.6     # A3
route add -net 10.65.0.16 netmask 255.255.255.252 gw 10.65.0.6     # A4 - Palantir
route add -net 10.65.0.128 netmask 255.255.255.128 gw 10.65.0.6    # A6 - Gilgalad & Cirdan

# Via Moria (A9)
route add -net 10.65.0.20 netmask 255.255.255.252 gw 10.65.0.10    # A10
route add -net 10.65.0.64 netmask 255.255.255.192 gw 10.65.0.10    # A11 - Durin
route add -net 10.65.0.32 netmask 255.255.255.248 gw 10.65.0.10    # A12 - Khamul
route add -net 10.65.0.40 netmask 255.255.255.248 gw 10.65.0.10    # A13 - IronHills

# Via Rivendell (A7)
route add -net 10.65.0.24 netmask 255.255.255.252 gw 10.65.0.18    # Switch1
route add -net 10.65.0.28 netmask 255.255.255.252 gw 10.65.0.18    # A13 - Vilya
route add -net 10.65.0.29 netmask 255.255.255.252 gw 10.65.0.18    # Narya (sesuaikan)
