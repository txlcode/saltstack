zabbix_source:
  file.managed:
    - name: /usr/local/src/zabbix.tar.gz
    - source: salt://zabbix/bags/zabbix.tar.gz
    - user: root
    - group: root
    - mode: 644
extract_zabbix:
  cmd.run:
    - cwd: /usr/local/src
    - names :
      - tar zxvf zabbix.tar.gz -C /usr/local
    - require:
      - file: zabbix_source
zabbix_user:
  user.present:
    - name: zabbix
    - createhome: False
    - gid_from_name: True
    - shell: /sbin/nologin
