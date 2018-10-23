# saltstack
dev

mysql 安装时候需要注意的
1 mysql/conf.sls

    salt://mysql/files/conf.sh:
      cmd.script: 
        #- unless: test -d /data/database/ 运行完第一次 请去掉这行注释
        - env:
          - BATCH: 'yes'
        - require:
          - cmd: mysql_commpile
          - pkg: mysql_pkg
