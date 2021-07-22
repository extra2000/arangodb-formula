# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as ARANGODB with context %}

ARANGODB-selinux-policy-present:
  cmd.run:
    - name: semodule -i {{ ARANGODB['projectname'] }}_arangodb_pod_srv01.cil /usr/share/udica/templates/{base_container.cil,net_container.cil}
    - cwd: {{ ARANGODB.rootdir }}
