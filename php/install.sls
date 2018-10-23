install_soft:
  pkg.installed:
    - names:
      - openssl-devel
      - libmcrypt
      - libmcrypt-devel 
      - bzip2 
      - bzip2-devel
      - php-mssql
      - zlib
      - libxml
      - libjpeg
      - freetype
      - libpng
      - gd
      - curl
      - libiconv
      - zlib-devel
      - libxml2-devel
      - libjpeg-devel
      - freetype-devel
      - libpng-devel
      - gd-devel
      - curl-devel
      - libxslt-devel
      - freetds
      - freetds-devel
php_source:
  file.managed:
    - name: /usr/local/src/php-5.6.38.tar.gz
    - unless: test -f /usr/local/src/php-5.6.38.tar.gz
    - source: salt://php/bags/php-5.6.38.tar.gz
install_php:
  cmd.run:
    - names: cd /usr/local/src/ && tar zxf php-5.6.38.tar.gz && cd php-5.6.38/ && ./configure --prefix=/opt/php --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-openssl --enable-mbstring --with-freetype-dir --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml  --enable-sockets --enable-zip --enable-soap --enable-short-tags --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization  --enable-fpm --with-mcrypt  --with-config-file-path=/opt/php/etc --with-config-file-scan-dir=/opt/php/etc/php.d --with-bz2  --with-gd --enable-gd-native-ttf --enable-maintainer-zts && make && make install
    - unless: test -d /opt/php/