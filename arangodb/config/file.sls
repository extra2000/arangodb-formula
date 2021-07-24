# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as ARANGODB with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

{%- set container_files = [
    'arangod.conf',
    'arangodb-configmap.yaml',
    'arangodb-pod.yaml'
  ]
%}

{%- for container_file in container_files %}
ARANGODB-{{ container_file }}-file-managed:
  file.managed:
    - name: {{ ARANGODB.rootdir }}/{{ container_file }}
    - source: {{ files_switch([container_file]) }}
    - mode: 644
    - user: {{ ARANGODB.hostuser.name }}
    - group: {{ ARANGODB.hostuser.group }}
    - makedirs: True
    - template: jinja
    - context:
        ARANGODB: {{ ARANGODB | json }}
{%- endfor %}

ARANGODB-podman-network-file-managed:
  file.managed:
    {%- if ARANGODB.hostuser.name == 'root' %}
    - name: /etc/cni/net.d/podman-network-{{ ARANGODB.pod.network.domain_name }}.conflist
    {%- else %}
    - name: /home/{{ ARANGODB.hostuser.name }}/.config/cni/net.d/podman-network-{{ ARANGODB.pod.network.domain_name }}.conflist
    {%- endif %}
    - source: {{ files_switch(['podman-network.conflist']) }}
    - mode: 644
    - user: {{ ARANGODB.hostuser.name }}
    - group: {{ ARANGODB.hostuser.group }}
    - makedirs: True
    - template: jinja
    - context:
        ARANGODB: {{ ARANGODB | json }}

ARANGODB-selinux-policy-file-managed:
  file.managed:
    - name: {{ ARANGODB.rootdir }}/{{ ARANGODB['projectname'] }}_arangodb_pod_srv01.cil
    - source: {{ files_switch(['arangodb_pod_srv01.cil']) }}
    - mode: 644
    - user: {{ ARANGODB.hostuser.name }}
    - group: {{ ARANGODB.hostuser.group }}
    - makedirs: True
    - template: jinja
    - context:
        ARANGODB: {{ ARANGODB | json }}

ARANGODB-seccomp-file-managed:
  file.managed:
    - name: {{ ARANGODB.rootdir }}/seccomp/seccomp.json
    - source: {{ files_switch(['seccomp.json']) }}
    - mode: 644
    - user: {{ ARANGODB.hostuser.name }}
    - group: {{ ARANGODB.hostuser.group }}
    - makedirs: True
    - template: jinja
    - context:
        ARANGODB: {{ ARANGODB | json }}
