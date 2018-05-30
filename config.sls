include:
  - apache.restart

apache_config_file:
  file.managed:
    - name: /etc/apache2/apache2.conf
    - source: salt://apache/files/apache2.conf
    - require:
      - pkg: apache2

