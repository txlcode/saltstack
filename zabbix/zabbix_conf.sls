zabbix_conf:
  file.managed:
    - name: /usr/local/zabbix/etc/zabbix_agentd.conf
    - source: salt://zabbix/conf/zabbix_agentd.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 644
     
