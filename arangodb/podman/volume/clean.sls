# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as ARANGODB with context %}

ARANGODB-volumes-absent:
  cmd.run:
    - name: podman volume rm --force {{ ARANGODB.projectname }}-arangodb-srv01-data
    - runas: {{ ARANGODB.hostuser.name }}
    - success_retcodes:
      - 0
      - 1
