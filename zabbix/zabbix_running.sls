zabbix_running:
  service.running:
    - name: zabbix_agentd
    - enable: True
    #- watch:
    #  - file: zabbix_conf
