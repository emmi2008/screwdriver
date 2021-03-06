#!/bin/bash
. /etc/setupfunctions
hostname demo
ifconfig lo 127.0.0.1
loop=1
while [ $loop -ne 0 ]
do
	echo
	link=`ethtool eth0|grep Speed|sed "s/[ \t]//g"`
	ip=`waitinput "Set eth0 ($link)'s IP (default: 192.168.1.111)? " 192.168.1.111`
	ifconfig eth0 $ip
	loop=$?
done
echo "
WEBUI: please visit http://$ip/
"|tee -a /etc/welcome
