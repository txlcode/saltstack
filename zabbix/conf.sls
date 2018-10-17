zabbix_conf:
  file.managed:
    - name: /usr/local/zabbix/etc/zabbix_agentd.conf
    - source: salt://zabbix/conf/zabbix_agentd.j2
    - template: jinja
zabbix_service:
  file.managed:
    - name: /etc/init.d/zabbix_agentd
    - user: root
    - mode: 755
    - source: salt://zabbix/files/zabbix_agentd
  cmd.run:
    - names:
      - /sbin/chkconfig --add zabbix_agentd
      - /sbin/chkconfig zabbix_agentd on
  service.running:
    - name: zabbix_agentd
    - enable: True
    - watch:
         - file: /usr/local/zabbix/etc/zabbix_agentd.conf
