zabbix_init:
  user.present:
    - name: zabbix 
    - shell: /sbin/nologin
    - home: /home/zabbix

  pkg.installed:
    - name: gcc  

