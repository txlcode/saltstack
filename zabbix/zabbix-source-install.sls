zabbix-source-install:
  file.managed:
    - unless: test -f /usr/local/src/zabbix-3.0.12.tar.gz
    - name: /usr/local/src/zabbix-3.0.12.tar.gz
    - source: salt://zabbix/bags/zabbix-3.0.12.tar.gz
    - user: root
    - group: root
    - mode: 644
install-zabbix:
  cmd.run:
    - unless: test -d /usr/local/zabbix
    - name: cd /usr/local/src && tar -zxvf zabbix-3.0.12.tar.gz && cd zabbix-3.0.12 && ./configure --prefix=/usr/local/zabbix --enable-agent && make && make install
zabbix-scripts: 
  cmd.script:
    - unless: test -f /etc/init.d/zabbix_agentd
    - name: salt://zabbix/scripts/install_zabbix.sh
    - user: root
    - repuire:
      - cmd: install-zabbix
