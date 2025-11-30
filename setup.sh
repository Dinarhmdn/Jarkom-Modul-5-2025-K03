#!/bin/bash
# /root/setup-osiliath-autodetect.sh

echo "============================================"
echo "   OSILIATH SETUP - AUTO DETECT GATEWAY"
echo "============================================"

# 1. Enable IP Forwarding
echo ""
echo "[1/6] Enabling IP Forwarding..."
echo 1 > /proc/sys/net/ipv4/ip_forward

# 2. Setup eth0 (Internet)
echo ""
echo "[2/6] Setting up eth0 (Internet Connection)..."

# Kill DHCP clients
killall dhclient 2>/dev/null

# Request DHCP
dhclient -r eth0 2>/dev/null
dhclient eth0

sleep 3

# Get eth0 IP
IP_ETH0=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
echo "eth0 IP: $IP_ETH0"

# Try to detect gateway
GW=$(ip route | grep "^default" | awk '{print $3}' | head -1)

if [ -z "$GW" ]; then
    echo "No default gateway detected, trying common gateways..."
    
    # Try common gateways
    for gw in 192.168.4.1 192.168.122.1 10.0.2.2 192.168.1.1; do
        echo "Trying gateway: $gw"
        if ping -c 1 -W 1 $gw >/dev/null 2>&1; then
            GW=$gw
            echo "✓ Gateway found: $GW"
            break
        fi
    done
fi

if [ -z "$GW" ]; then
    echo "✗ ERROR: Could not detect gateway!"
    echo "Please check NAT1 configuration in GNS3"
    exit 1
fi

# Add default route
echo "Adding default route via $GW..."
ip route add default via $GW dev eth0 2>/dev/null

# 3. Configure Internal Interfaces
echo ""
echo "[3/6] Configuring Internal Interfaces..."

ip addr add 10.65.0.17/30 dev eth1 2>/dev/null
ip addr add 10.65.0.9/30 dev eth2 2>/dev/null
ip addr add 10.65.0.5/30 dev eth3 2>/dev/null

ip link set eth1 up
ip link set eth2 up
ip link set eth3 up

# 4. Setup DNS
echo ""
echo "[4/6] Setting up DNS..."
cat > /etc/resolv.conf <<EOF
nameserver $GW
nameserver 8.8.8.8
nameserver 8.8.4.4
EOF

# 5. Setup NAT (SNAT)
echo ""
echo "[5/6] Setting up NAT (SNAT)..."
iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $IP_ETH0

# 6. Add Internal Routes
echo ""
echo "[6/6] Adding Internal Routes..."

# Via Minastir
ip route add 10.65.1.0/24 via 10.65.0.6 dev eth3 2>/dev/null
ip route add 10.65.0.8/30 via 10.65.0.6 dev eth3 2>/dev/null
ip route add 10.65.0.12/30 via 10.65.0.6 dev eth3 2>/dev/null
ip route add 10.65.0.16/30 via 10.65.0.6 dev eth3 2>/dev/null
ip route add 10.65.0.128/25 via 10.65.0.6 dev eth3 2>/dev/null

# Via Moria
ip route add 10.65.0.20/30 via 10.65.0.10 dev eth2 2>/dev/null
ip route add 10.65.0.64/26 via 10.65.0.10 dev eth2 2>/dev/null
ip route add 10.65.0.32/29 via 10.65.0.10 dev eth2 2>/dev/null
ip route add 10.65.0.40/29 via 10.65.0.10 dev eth2 2>/dev/null

# Via Rivendell
ip route add 10.65.0.24/30 via 10.65.0.18 dev eth1 2>/dev/null
ip route add 10.65.0.28/30 via 10.65.0.18 dev eth1 2>/dev/null

echo ""
echo "============================================"
echo "   CONFIGURATION SUMMARY"
echo "============================================"
echo "eth0 IP: $IP_ETH0"
echo "Gateway: $GW"
echo ""
echo "Routing Table:"
ip route show
echo ""
echo "NAT Rules:"
iptables -t nat -L POSTROUTING -n
echo ""
echo "============================================"
echo "   TESTING CONNECTIVITY"
echo "============================================"
echo ""
echo "Test 1: Gateway ($GW)"
ping -c 2 $GW && echo "✓ SUCCESS" || echo "✗ FAILED"

echo ""
echo "Test 2: Internet (8.8.8.8)"
ping -c 2 8.8.8.8 && echo "✓ SUCCESS" || echo "✗ FAILED"

echo ""
echo "Test 3: DNS Resolution"
nslookup google.com && echo "✓ SUCCESS" || echo "✗ FAILED"

echo ""
echo "============================================"
