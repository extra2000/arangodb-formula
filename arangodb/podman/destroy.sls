# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as ARANGODB with context %}

ARANGODB-pod-absent:
  cmd.run:
    - name: podman pod rm --force {{ ARANGODB.projectname }}-arangodb-pod
    - runas: {{ ARANGODB.hostuser.name }}
    - success_retcodes:
      - 0
      - 1
