# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as ARANGODB with context %}

ARANGODB-rootdir-absent:
  file.absent:
    - name: {{ ARANGODB.rootdir }}

ARANGODB-podman-network-file-absent:
  file.absent:
    {%- if ARANGODB.hostuser.name == 'root' %}
    - name: /etc/cni/net.d/podman-network-arangodbnet.conflist
    {%- else %}
    - name: /home/{{ ARANGODB.hostuser.name }}/.config/cni/net.d/podman-network-arangodbnet.conflist
    {%- endif %}
