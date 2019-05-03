ip netns add dhcp0

ip link add dev dhcp0-veth0 type veth peer name v-peer0 # create dhcp0-veth0 with v-cable to v-peer0
ip link set dev v-peer0 netns dhcp0 			# move v-peer0 to ns

brctl addif lxcbr0 dhcp0-veth0				# Add interface to linux bridge
ip addr add 10.200.1.1/24 dev lxcbr0			# Add IP to bridge
ip link set dev dhcp0-veth0 up				# Enable interface

ip netns exec dhcp0 ip addr add 10.200.1.2/24 dev v-peer0 # Add ip inside namespace
ip netns exec dhcp0 ip link set v-peer0 up		  # Enable interface inside namespace
ip netns exec dhcp0 ip link set lo up			  # Enable lo interface


iptables -t nat -A POSTROUTING -s 10.200.1.0/24 ! -d 10.200.1.0/24 -j MASQUERADE # Enable SNAT


RULES="
iptables -L -v -n
ifconfig
netstat -nltpt
"

ip netns exec dhcp0 bash <<<$RULES

