#!/bin/bash
if [ -d "OpenVPN" ]; then
	rm -f "OpenVPN/*.ovpn"
else
	mkdir "OpenVPN"
fi

if [ ! -a "OpenVPN/ca.crt" ] && [ ! -a "OpenVPN/crl.pem" ] && [ ! -a "OpenVPN/credentials.txt" ]; then
	rm -f "OpenVPN/crl.pem"
	rm -f "OpenVPN/ca.crt"
	rm -f "OpenVPN/credentials.txt"
	cd "OpenVPN"
	echo -n "Downloading ca.crt and crl.pem..."
	wget -q "https://www.privateinternetaccess.com/openvpn/openvpn.zip"
	unzip -qq openvpn.zip *.pem *.crt
	mv *.pem crl.pem
	mv *.crt ca.crt
	rm openvpn.zip
	echo " OK"
	echo -n "Please enter your username: "
	read piaLogin
	echo -n "Please enter your password: "
	read -s piaPassword
	echo ""
	echo -n "Writing username and password into OpenVPN/credentials.txt..."
	cat << EOF > credentials.txt
$piaLogin
$piaPassword
EOF
	echo " OK"
	cd ..
fi
echo -n "Downloading the server list..."
json=`wget -q -O - 'https://privateinternetaccess.com/vpninfo/servers?version=24' | head -1`
echo " OK"
python <<EOF
payload = '$json'
import json
d = json.loads(payload)
for k in d.keys():
	if k != 'info':
		target = open("OpenVPN/"+d[k]['name']+".ovpn", 'w')
		target.write("client\n")
		target.write("dev tun\n")
		target.write("proto udp\n")
		target.write("remote "+d[k]['dns']+" 1194\n")
		target.write("resolv-retry infinite\n")
		target.write("nobind\n")
		target.write("persist-key\n")
		target.write("persist-tun\n")
		target.write("ca ca.crt\n")
		target.write("tls-client\n")
		target.write("remote-cert-tls server\n")
		target.write("auth-user-pass credentials.txt\n")
		target.write("nobind\n")
		target.write("comp-lzo\n")
		target.write("verb 1\n")
		target.write("reneg-sec 0\n")
		target.write("crl-verify crl.pem\n")
		print("OpenVPN/"+d[k]['name']+".ovpn")
EOF
