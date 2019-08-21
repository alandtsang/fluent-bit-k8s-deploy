# fluent-bit-k8s-deploy
Deploy fluent bit on kubernetes

## Install
Deploy fluent-bit ServiceAccount, ClusterRole, ClusterRoleBinding.

Fluent-bit will run in DaemonSet mode and output the log to the http server in json format.

You need to configure `FLUENT_HTTP_HOST` and `FLUENT_HTTP_PORT` in fluent-bit-configmap.yaml.
`FLUENT_HTTP_HEADER` and `FLUENT_HTTP_URI` are optional.

```
make install
```

## Delete
Delete fluent bit.

```
make delete
```
