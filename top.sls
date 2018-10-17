base:
  "*":
    - init.init
  'node3':
    - mysql 
  "node2":
   # - match: list
   # - php
    - zabbix
   # - zabbix
  "spark1":
    - zabbix
  "bigdata":
    - zabbix
