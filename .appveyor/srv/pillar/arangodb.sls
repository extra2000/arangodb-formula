# -*- coding: utf-8 -*-
# vim: ft=yaml
---
arangodb:
  lookup:
    projectname: arangodb
    rootdir: /opt/arangodb
    hostuser:
      name: root
      group: root
    pod:
      network:
        subnet: 10.77.1.0/24
        gateway: 10.77.1.1
        domain_name: arangodbnet
        bridge: cni-podman1
    arangodb:
      restart_policy: OnFailure
      port:
        nonencrypted:
          container: 8529
          host: 8529
          ip: 0.0.0.0
          protocol: tcp
          bind: true
      root_password: abcde12345
      database:
        name: mydb
        username: myuser
        password: abcde12345
      resources:
        requests:
          memory: 2000Mi
          cpu: 1000m
        limits:
          memory: 2000Mi
          cpu: 1000m
