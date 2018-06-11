{% from "apache/map.jinja" import apache with context %}

{% if grains['os_family'] == 'RedHat' %}

vhosts_dir:
  file.directory:
    - name: /etc/httpd/vhosts.d/
    - makedirs: True

{% endif %}

{% for site, arg in salt['pillar.get']('apache:vhosts', {}).items() %}

{{ site }}_vhost_gen:
  apache.configfile:
    - name: {{ apache.vhost_loc }}{{ site }}
    - config:
      - VirtualHost:
          this: '*:80'
          ServerName:
            - {{ arg.servername }}
          ServerAlias:
            - {{ arg.serveralias }}
          ErrorLog: {{ arg.errorlog }}
          CustomLog: {{ arg.customlog }}
          DocumentRoot: {{ arg.docroot }}

{% endfor %}
