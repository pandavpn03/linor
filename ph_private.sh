#!/bin/bash

#set localtime
ln -fs /usr/share/zoneinfo/Asia/Manila /etc/localtime

# installing 
wget http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm
yum install epel-release-6-8.noarch.rpm -y
yum install unzip -y
rm /etc/sysctl.conf

# get file
wget -O /etc/private.zip "https://raw.githubusercontent.com/pandavpn03/linor/master/private.zip"
cd /etc/
unzip private.zip
cd


sysctl -p
yum install mysql-server  dos2unix  nano squid openvpn easy-rsa httpd -y
setenforce 0
mkdir /var/www/html/status
touch /var/www/html/status/tcp.txt
touch /var/www/html/status/logs.txt
chmod 775 /var/www/html/status/*
chmod 775 /etc/openvpn/login/*


echo "acl Denied_ports port 1025-65535
http_access deny Denied_ports
acl to_vpn dst `curl ipinfo.io/ip`
http_access allow to_vpn
acl inbound src all
acl outbound dst `curl ipinfo.io/ip`/32
http_access allow inbound outbound
http_access deny all
http_port 8080 transparent
http_port 3128 transparent
http_port 8000 transparent
http_port 53 transparent
http_port 9201 transparent
http_port 8888 transparent
http_port 9090 transparent
http_port 9191 transparent
visible_hostname proxy.ifastvpn.com
cache_mgr ifastvpn"| sudo tee /etc/squid/squid.conf


sudo /sbin/iptables -L -nsudo /sbin/iptables -L -n
sudo /sbin/iptables -L -n
ip -6 routeip -6 route
ip -6 route
iptables -I INPUT -s 0/0 -p tcp --dport 5666 -j ACCEPTiptables -I INPUT -s 0/0 -p tcp --dport 5666 -j ACCEPT
/sbin/iptables -L -n
/etc/init.d/iptables save
/etc/init.d/iptables stop
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -I NRPE -s 0/0 -p tcp --dport 5666 -j ACCEPT
echo 169.254.0.0/16 dev eth0 >> /etc/sysconfig/network-scripts/route-eth0
service network restartecho 169.254.0.0/16 dev eth0 >> /etc/sysconfig/network-scripts/route-eth0
service network restart
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o venet0 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -N LOGDROP > /dev/null 2> /dev/null
iptables -F LOGDROP
iptables -A LOGDROP -j DROP
service iptables save
service iptables restart
echo 0 > /selinux/enforce
SELINUX=enforcing
SELINUX=disabled
service openvpn restart
service squid restart
cd	

# installing 
yum install fail2ban -y
rm /etc/fail2ban/jail.local

# Copy File
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# get file
wget -O /etc/fail2ban.zip "https://raw.githubusercontent.com/pandavpn03/linor/master/fail2ban.zip"
cd /etc/
unzip fail2ban.zip
cd


#start fail2ban service
chkconfig --level 23 fail2ban on
service fail2ban start
 
#start service
yum install httpd -y
service httpd start




echo 'Done setup you can now close the terminal window and exit the app!';
echo '#############################################
#      CENTOS 6 Setup openvpn FIXED         #
#         Authentication file system        #
#       Setup by: DMSDeveloper (Devmaxx)    #
#          Server System: Devmaxx           #
#            owner: DMSDeveloper            #
#############################################';