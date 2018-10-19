nginx_conf:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://nginx/templates/nginx.j2
    - template: jinja
    - user: root
    - group: root
    - mode: 644

