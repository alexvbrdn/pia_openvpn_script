#!/bin/bash
if [ ! -d "OpenVPN" ]; then
	bash updateList.bash
fi
clear
cd OpenVPN
echo "Private Internet Access OPENVPN SCRIPT"
echo "**************************************"
i=0;
declare -a servers
for f in *.ovpn
do
	echo "$i.$f"
	servers[$i]=$f
	i=$((i+1))
done

echo -n "Server: "
read s
re='^[0-9]+$'
if ! [[ $s =~ $re ]] || [ -z ${servers[$s]} ]; then
	echo "Invalid server."
else
	clear
	openvpn --config "${servers[$s]}"
fi

