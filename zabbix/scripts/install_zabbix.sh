#!/bin/bash
cd /usr/local/src/zabbix-3.0.12
echo 'zabbix-agent 10050/tcp #Zabbix Agent' >> /etc/services 
echo 'zabbix-agent 10050/udp #Zabbix Agent' >> /etc/services
cp misc/init.d/fedora/core/zabbix_agentd /etc/init.d/
sed -i 's/BASEDIR=\/usr\/local/BASEDIR=\/usr\/local\/zabbix/g' /etc/init.d/zabbix_agentd
chmod +x /etc/init.d/zabbix_agentd
