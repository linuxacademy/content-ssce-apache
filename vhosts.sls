{% from "apache/map.jinja" import apache with context %}

{% if grains['os_family'] == 'RedHat' %}

vhosts_dir:
  file.directory:
    - name: /etc/httpd/vhosts.d/
    - makedirs: True

{% endif %}

eski_vhosts:
  apache.configfile:
    - name: {{ apache.vhost_loc }}eski.conf
    - config:
      - VirtualHost:
          this: '*:80'
          ServerName:
            - eski.com
          ServerAlias:
            - www.eski.com
          ErrorLog: logs/website.com-error_log
          CustomLog: logs/website.com-access_log combined
          DocumentRoot: /var/www/html/website.com
