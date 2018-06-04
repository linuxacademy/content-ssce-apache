apache_vhosts_file:
  file.managed:
    - name: /etc/apache2/sites-available/000-default.conf
    - source: salt://apache/files/vhosts.conf
    - require:
      - pkg: apache2

