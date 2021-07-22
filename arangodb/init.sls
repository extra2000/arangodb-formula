# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - .config
  {%- if grains['os_family'] == 'RedHat' %}
  - .selinux
  {%- endif %}
  - .podman
