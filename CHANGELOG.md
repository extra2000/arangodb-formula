# Changelog

### [1.1.1](https://github.com/extra2000/arangodb-formula/compare/v1.1.0...v1.1.1) (2021-07-24)


### Code Refactoring

* **podman-network:** rename Podman network `.conflist` file ([5027de0](https://github.com/extra2000/arangodb-formula/commit/5027de024ee1e15944b9fcd95e7101909e14e634))


### Documentations

* **README:** add Section Prerequisites ([8212c70](https://github.com/extra2000/arangodb-formula/commit/8212c708d092ebdc2202a9f4ceeb1c73d75cfda5))


### Fixes

* **podman-network:** fix Podman network doesn't properly isolated per project name ([0f66705](https://github.com/extra2000/arangodb-formula/commit/0f66705b5bde6c791ac00b8ffb8532466e5bee35))
* **selinux:** allow `unreserved_port_t:tcp_socket name_connect` ([102eca4](https://github.com/extra2000/arangodb-formula/commit/102eca454941068fa5522815a1b6a2d34039451d))

## [1.1.0](https://github.com/extra2000/arangodb-formula/compare/v1.0.0...v1.1.0) (2021-07-23)


### Features

* **seccomp:** add default `seccomp` profile ([ead96ea](https://github.com/extra2000/arangodb-formula/commit/ead96eae4e2052e8a50763955f8ab77096c9d22c))


### Fixes

* **arangodb.clean:** forgot to clean SELinux policy ([87cf929](https://github.com/extra2000/arangodb-formula/commit/87cf92963c8d65f26fa7fbf23455ce505350d1f5))


### Continuous Integrations

* **AppVeyor:** add instruction for `arangodb` state ([944fbff](https://github.com/extra2000/arangodb-formula/commit/944fbffcc98b4ac032a5bd0d0dc76fd9c5032e19))
* **AppVeyor:** add Podman installation ([af84f89](https://github.com/extra2000/arangodb-formula/commit/af84f898a37740997b00ba7a4ef2760e57453c52))
* **AppVeyor:** add SaltStack `v3003.1` installation ([3061d30](https://github.com/extra2000/arangodb-formula/commit/3061d3003e3b3845084f14e817dc008f878d03a0))
* **AppVeyor:** add workaround for SaltStack jinja2 `3.0.x` bug ([895ad69](https://github.com/extra2000/arangodb-formula/commit/895ad69c486cd2c2fba73437fc66b0afb5ab50ac))


### Documentations

* **README:** fix Subsubsection links ([2497092](https://github.com/extra2000/arangodb-formula/commit/249709241dff0abe71608beb8b3d2c9748bd714f))

## 1.0.0 (2021-07-22)


### Features

* add required implementations ([b9b767f](https://github.com/extra2000/arangodb-formula/commit/b9b767fdb7aee36646e90c6998527d2dbc2ec0f8))


### Documentations

* **README:** update `README.md` ([9c6fcba](https://github.com/extra2000/arangodb-formula/commit/9c6fcba39202ebabda4fbed2ea9cf0177e228548))


### Continuous Integrations

* add AppVeyor with `semantic-release` ([921711f](https://github.com/extra2000/arangodb-formula/commit/921711f382e756cea884e59dee1753cc02fa3d3d))
