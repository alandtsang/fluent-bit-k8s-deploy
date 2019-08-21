# fluent-bit-k8s-deploy
[![License](https://img.shields.io/badge/license-Apache%202-4EB1BA.svg)](https://www.apache.org/licenses/LICENSE-2.0.html)

Deploy fluent bit on kubernetes, send log to http endpoint.

## Deploy
Deploy fluent-bit ServiceAccount, ClusterRole, ClusterRoleBinding.

Fluent-bit will run in DaemonSet mode and output the log to the http server in json format.

You need to configure `FLUENT_HTTP_HOST` and `FLUENT_HTTP_PORT` in Makefile, 
`FLUENT_HTTP_HEADER` and `FLUENT_HTTP_URI` are optional.

```
make deploy
```

## Delete
Delete fluent bit.

```
make delete
```

## Clean
Remove build directory.
```
make clean
```

# Get Help
The fastest way to get response is to send email to my mail:
- <zengxianglong0@gmail.com>

# License
Please refer to [LICENSE](https://github.com/alandtsang/fluent-bit-k8s-deploy/blob/master/LICENSE) file.
