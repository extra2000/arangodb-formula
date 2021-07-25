# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as ARANGODB with context %}

{%- if ARANGODB.pod.network.use_podman_default_network %}
{%- set network_param = '--network="podman"' %}
{%- else %}
{%- set network_param = '--network="' + ARANGODB.pod.network.domain_name + '"' %}
{%- endif %}

ARANGODB-pod-present:
  cmd.run:
    - name: podman play kube {{ network_param }} --configmap arangodb-configmap.yaml --seccomp-profile-root {{ ARANGODB['rootdir'] }}/seccomp arangodb-pod.yaml
    - cwd: {{ ARANGODB.rootdir }}
    - runas: {{ ARANGODB.hostuser.name }}
