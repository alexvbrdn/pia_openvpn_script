# pia_openvpn_script

To use this script, you have to mkdir OpenVPN is the same directory as VPN.SH
Then, put all your .ovpn files into the OpenVPN folder.

Edit each .ovpn file and add this line: auth-user-pass credentials.txt

Then, touch credentials.txt inside the OpenVPN folder. The first line of credential.txt should be your VPN username, and the second your password.

Enjoy
