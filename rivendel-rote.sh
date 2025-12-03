sysctl -w net.ipv4.ip_forward=1
ip route add default via 10.65.0.17 2>/dev/null
