vhost_conf:
  file.managed:
    - name: /etc/nginx/conf.d/nginx.conf
    - source: salt://nginx/file/test_vhost.conf
    - user: root
    - group: root
    - mode: 644
