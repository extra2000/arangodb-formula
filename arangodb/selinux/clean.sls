# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as ARANGODB with context %}

ARANGODB-selinux-policy-absent:
  cmd.run:
    - name: semodule -r {{ ARANGODB.projectname }}_arangodb_pod_srv01
    - success_retcodes:
      - 0
      - 1
