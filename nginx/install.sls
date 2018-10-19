nginx_source:
  file.managed:
    - unless: test -f /usr/local/src/nginx-1.14.0-mian_anzhuang.tar.gz
    - name: /usr/local/src/nginx-1.14.0-mian_anzhuang.tar.gz
    - source: salt://nginx/bags/nginx-1.14.0-mian_anzhuang.tar.gz
    - user: root
    - group: root
    - mode: 644
nginx_user:
  user.present:
    - name: nginx
    - createhome: False
    - gid_from_name: True
    - shell: /sbin/nologin
extract_nginx:
  cmd.run:
    - unless: test -d /opt/nginx-1.14.0/
    - cwd: /usr/local/src
    - names :
      - tar zxvf nginx-1.14.0-mian_anzhuang.tar.gz -C /opt && chown nginx:nginx -R /opt/nginx-1.14.0 && ln -s /opt/nginx-1.14.0 /opt/nginx
      - mkdir -p /data/logs/nginx && chmod 777 -R /data/logs 
    - require:
      - file: nginx_source
openssl_source:
  file.managed:
    - unless: test -f /usr/local/src/openssl-1.1.0g.tar.gz
    - name: /usr/local/src/openssl-1.1.0g.tar.gz
    - source: salt://nginx/bags/openssl-1.1.0g.tar.gz
    - user: root
    - group: root
    - mode: 644
extract_install_nginx:
  cmd.run:
    - unless: test -d /usr/local/src/openssl-1.1.0g
    - cwd: /usr/local/src
    - names :
      - tar zxvf openssl-1.1.0g.tar.gz && cd openssl-1.1.0g && ./config --prefix=/usr/local/openssl && make && make install; mv /usr/bin/openssl  /usr/bin/openssl.old ; mv /usr/include/openssl /usr/include/openssl.old ; ln -s /usr/local/openssl/bin/openssl /usr/bin/openssl && ln -s /usr/local/openssl/include/openssl /usr/include/openssl && ln -s /usr/local/openssl/lib/libssl.so /usr/local/lib64/libssl.so && ln -s /usr/local/openssl/lib/libcrypto.so /usr/local/lib64/libcrypto.so && echo '/usr/local/openssl/lib' >> /etc/ld.so.conf
    - require:
      - file: openssl_source
