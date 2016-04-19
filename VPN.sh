cd OpenVPN
clear
echo "Private Internet Access OPENVPN SCRIPT"
echo "************ kasterb 2015 *************"
echo "1.AU_Melbourne"
echo "2.AU_Sydney"
echo "3.Brazil"
echo "4.CA_North_York"
echo "5.CA_Toronto"
echo "6.France"
echo "7.Germany"
echo "8.Hong_Kong"
echo "9.Ireland"
echo "10.Israel"
echo "11.Italy"
echo "12.Japan"
echo "12.Mexico"
echo "13.Netherlands"
echo "14.Romania"
echo "15.Russia"
echo "16.Singapore"
echo "17.Sweden"
echo "18.Switzerland"
echo "19.Turkey"
echo "20.UK_London"
echo "21.UK_Southampton"
echo "21.US_California"
echo ""
echo -n "Server:"
read server
clear

if [ $server = "1" ]
then
        openvpn --config AU_Melbourne.ovpn
	echo "test"
elif [ $server = "2" ]
then
        openvpn --config AU_Sydney.ovpn
elif [ $server = "3" ]
then
        openvpn --config Brazil.ovpn
elif [ $server = "4" ]
then
        openvpn --config CA_North_York.ovpn
elif [ $server = "5" ]
then
        openvpn --config CA_Toronto.ovpn
elif [ $server = "6" ]
then
        openvpn --config France.ovpn
elif [ $server = "7" ]
then
        openvpn --config Germany.ovpn
elif [ $server = "8" ]
then
        openvpn --config Hong_Kong.ovpn
elif [ $server = "9" ]
then
        openvpn --config Ireland.ovpn
elif [ $server = "10" ]
then
        openvpn --config Israel.ovpn
elif [ $server = "11" ]
then
        openvpn --config Japan.ovpn
elif [ $server = "12" ]
then
        openvpn --config Mexico.ovpn
elif [ $server = "13" ]
then
        openvpn --config Netherlands.ovpn
elif [ $server = "14" ]
then
        openvpn --config Romania.ovpn
elif [ $server = "15" ]
then
        openvpn --config Russia.ovpn
elif [ $server = "16" ]
then
        openvpn --config Singapore.ovpn
elif [ $server = "17" ]
then
        openvpn --config Switzerland.ovpn
elif [ $server = "18" ]
then
        openvpn --config Turkey.ovpn
elif [ $server = "19" ]
then
        openvpn --config UK_London.ovpn
elif [ $server = "20" ]
then
        openvpn --config UK_Southampton.ovpn
elif [ $server = "21" ]
then
        openvpn --config US_California.ovpn
else
	echo "Invalid server number"
fi


