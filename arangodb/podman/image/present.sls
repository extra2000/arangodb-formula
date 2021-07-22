# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as ARANGODB with context %}

ARANGODB-podman-image-present:
  cmd.run:
    - name: podman image pull {{ ARANGODB['arangodb']['image'] }}
    - runas: {{ ARANGODB.hostuser.name }}
    - unless:
      - '[[ "$(podman image ls -q {{ ARANGODB['arangodb']['image'] }})" != "" ]]'
