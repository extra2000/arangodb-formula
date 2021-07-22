# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - .podman.clean
  {%- if grains['os_family'] == 'RedHat' %}
  - .selinux.clean
  {%- endif %}
  - .config.clean
