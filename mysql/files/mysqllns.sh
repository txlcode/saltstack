#!/bin/bash
ln -sv /opt/mysql/bin/mysql /usr/bin
ln -sv /opt/mysql/bin/mysqladmin /usr/bin/
ln -sv /opt/mysql/bin/mysqldump /usr/bin/
ln -sv /opt/mysql/mysql.sock /tmp/mysql.sock
#mysq competence
/bin/mkdir /data/mysql/ && /bin/chown -R mysql:mysql /data/mysql/ 
