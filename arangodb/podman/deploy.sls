# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as ARANGODB with context %}

ARANGODB-pod-present:
  cmd.run:
    - name: podman play kube --network=arangodbnet --configmap arangodb-configmap.yaml arangodb-pod.yaml
    - cwd: {{ ARANGODB.rootdir }}
    - runas: {{ ARANGODB.hostuser.name }}