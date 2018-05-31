apache_vhosts:
  file.managed:
    - name: /etc/apache2/sites-available/000-default.conf
    - source: salt://apache/files/default_vhosts.conf
    - makedirs: True
    - require:
      - pkg: apache2

