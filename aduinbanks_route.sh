ysctl -w net.ipv4.ip_forward=1
# Gateway ke IP Pelargir yang BARU (.53)
ip route add default via 10.65.0.53 2>/dev/null
