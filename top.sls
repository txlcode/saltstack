base:
  "*":
    - init.init
  'slave1':
    - zabbix
  "node2":
   # - match: list
   # - php
    - zabbix
   # - zabbix
  "spark1":
    - zabbix
  "bigdata":
    - zabbix
