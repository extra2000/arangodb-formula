# arangodb-formula

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build status](https://ci.appveyor.com/api/projects/status/7lvyc2l3vhv2sa52/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/arangodb-formula/branch/master) |

SaltStack Formula for [ArangoDB](https://www.arangodb.com/).


## Prerequisites

Make sure you have Podman `v3.0.1` and above installed. Then, continue to the following Subsections below.


### Increase `vm.max_map_count` to at least `1024000`

Execute:
```
sudo sysctl -w "vm.max_map_count=1024000"
```

Create `/etc/sysctl.d/vm-max-map-counts.conf` file with the following line:
```
vm.max_map_count=1024000
```


## Available states

- [`arangodb`](#arangodb)
- [`arangodb.config`](#arangodbconfig)
- [`arangodb.config.clean`](#arangodbconfigclean)
- [`arangodb.selinux`](#arangodbselinux)
- [`arangodb.selinux.clean`](#arangodbselinuxclean)
- [`arangodb.podman`](#arangodbpodman)
- [`arangodb.podman.image`](#arangodbpodmanimage)
- [`arangodb.podman.image.clean`](#arangodbpodmanimageclean)
- [`arangodb.podman.deploy`](#arangodbpodmandeploy)
- [`arangodb.podman.destroy`](#arangodbpodmandestroy)
- [`arangodb.podman.volume.clean`](#arangodbpodmanvolumeclean)
- [`arangodb.podman.clean`](#arangodbpodmanclean)
- [`arangodb.clean`](#arangodbclean)


### `arangodb`

*Meta-state (This is a state that includes other states).*

This deploys the ArangoDB podman pod.


### `arangodb.config`

This state will configure the `arangodb` podman pod deployment.


### `arangodb.config.clean`

This state will remove the configuration of the `arangodb` podman pod deployment.


### `arangodb.selinux`

This state will load SELinux security policy required by the `arangodb` podman pod deployment. Only applicable for RedHat families.


### `arangodb.selinux.clean`

This state will remove SELinux security policy used by the `arangodb` podman pod deployment.


### `arangodb.podman`

This state will deploy the `arangodb` podman pod. The `arangodb` podman image will be pulled automatically if the image doesn't exists.


### `arangodb.podman.image`

This state will pull the `arangodb` podman image only.


### `arangodb.podman.image.clean`

This state will remove the `arangodb` podman image.


### `arangodb.podman.destroy`

This state will destroy and remove the `arangodb` podman pod.


### `arangodb.podman.volume.clean`

This state will remove the `arangodb` podman pod's volume.

### `arangodb.podman.clean`

*Meta-state (This is a state that includes other states).*

This state will destroy the `arangodb` podman pod, remove volume, and remove image.

### `arangodb.clean`

*Meta-state (This is a state that includes other states).*

This state will destroy the `arangodb` podman pod, remove volume, remove image, and remove configurations for the `arangodb`.


## Testing

After finished applying `arangodb` state, test the deployment by connecting to the database:
```
sudo podman run -it --rm --network=arangodbnet docker.io/arangodb/arangodb:3.7.12 arangosh --server.endpoint tcp://localhost:8529 --server.username root --server.authentication true
```

Then, try to create a database:
```
db._createDatabase("myapp");
```

To access ArangoDB Web UI, go to http://localhost:8529.
