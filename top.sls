base:
  #"*":
  #  - init.init
  'node3':
    - mysql
    - nginx 
  "node2":
   # - match: list
   # - nginx
    - zabbix
    - mysql
  "spark1":
    - zabbix
  "bigdata":
    - zabbix
  "docker":
    - mysql
    - zabbix
