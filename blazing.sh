#!/bin/bash
wget -O /etc/openvpn/script/config.sh "https://raw.githubusercontent.com/pandavpn03/linor/master/config.sh"
cd /etc/openvpn/script/
chmod +x config.sh
service openvpn restart
rm blazing.sh
history -c
echo "Server is already authenticated to BlazingFast Account of Linor VPN"
echo "Please click enter to exit"
exit

