mysql_cnf:
  file.managed:
    - name: /etc/my.cnf
    - user: root
    - mode: 755
    - source: salt://mysql/conf/my.cnf

salt://mysql/files/conf.sh:
  cmd.script: 
    #- unless: test -d /data/database/ 运行完第一次 请去掉这行注释
    - env:
      - BATCH: 'yes'
    - require:
      - cmd: mysql_commpile
      - pkg: mysql_pkg

salt://mysql/files/mysqllns.sh:
  cmd.script:
    - unless: test -f /usr/bin/mysql
    - env:
      - BATCH: 'yes'
    - require:
      - cmd: mysql_commpile
      - pkg: mysql_pkg

mysql_service:
  file.managed:
    - name: /etc/init.d/mysqld
    - user: root
    - mode: 755
    - source: salt://mysql/files/mysqld
  cmd.run:
    - names:
      - /sbin/chkconfig --add mysqld
      - /sbin/chkconfig mysqld on
    - unless: /sbin/chkconfig --list mysqld
  service.running:
    - name: mysqld
    - enable: True
    - watch:
      - file: mysql_cnf
