# koel

![Version: 0.1.34](https://img.shields.io/badge/Version-0.1.34-informational?style=flat-square) ![AppVersion: v6.7.2](https://img.shields.io/badge/AppVersion-v6.7.2-informational?style=flat-square)

Koel

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/acjohnson/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/acjohnson/helm-charts/tree/master/charts/koel>
* <https://github.com/jgesc/docker_koel>
* <https://github.com/koel/koel>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add thejohnsons https://charts.thejohnsons.site
helm repo update
helm install koel thejohnsons/koel
```

## Installing the Chart

To install the chart with the release name `koel`

```console
helm install koel thejohnsons/koel
```

## Uninstalling the Chart

To uninstall the `koel` deployment

```console
helm uninstall koel
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install koel \
  --set timezone="America/New York" \
    thejohnsons/koel
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install koel thejohnsons/koel -f values.yaml
```

## Custom configuration

N/A

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| adminEmail | string | `"admin@example.com"` |  |
| adminName | string | `"Admin"` |  |
| adminPassword | string | `"changeme"` |  |
| apacheRunGroup | string | `"www-data"` |  |
| apacheRunUser | string | `"www-data"` |  |
| appEnv | string | `"production"` |  |
| appKey | string | `"base64:6Z4nhTRH7lsWQvc4Q/gr6fq2Y4uQmmWjurAvW0Q3GjQ="` |  |
| appUrl | string | `"https://koel.example.com"` |  |
| components.database | bool | `true` |  |
| components.koel | bool | `true` |  |
| database.affinity.anti_affinity | bool | `true` |  |
| database.affinity.type | string | `"requiredDuringSchedulingIgnoredDuringExecution"` |  |
| database.component | string | `"database"` |  |
| database.deploymentAnnotations | object | `{}` |  |
| database.gracePeriod | int | `30` |  |
| database.persistence.data.accessMode | string | `"ReadWriteOnce"` |  |
| database.persistence.data.enabled | bool | `true` |  |
| database.persistence.data.local_storage | bool | `false` |  |
| database.persistence.data.mountPath | string | `"/var/lib/mysql"` |  |
| database.persistence.data.name | string | `"data"` |  |
| database.persistence.data.size | string | `"50Gi"` |  |
| database.persistence.data.storageClass | string | `""` |  |
| database.podSecurityContext | object | `{}` |  |
| database.port | int | `3306` |  |
| database.probe.liveness.enabled | bool | `true` |  |
| database.probe.liveness.failureThreshold | int | `5` |  |
| database.probe.liveness.initialDelaySeconds | int | `30` |  |
| database.probe.liveness.periodSeconds | int | `60` |  |
| database.service.annotations | object | `{}` |  |
| database.tolerations | list | `[]` |  |
| dbConnection | string | `"mysql"` |  |
| dbDatabase | string | `"koel"` |  |
| dbPassword | string | `"changeme"` |  |
| dbRootPassword | string | `"changeme"` |  |
| dbUsername | string | `"koel"` |  |
| forceHttps | bool | `true` |  |
| fullnameOverride | string | `""` |  |
| hostNetwork | bool | `false` |  |
| httpPort | int | `80` |  |
| httpsPort | int | `443` |  |
| imagePullSecrets | list | `[]` |  |
| images.database.pullPolicy | string | `"IfNotPresent"` |  |
| images.database.repository | string | `"mariadb"` |  |
| images.database.tag | string | `"10.7.6-focal"` |  |
| images.koel.pullPolicy | string | `"IfNotPresent"` |  |
| images.koel.repository | string | `"registry.thejohnsons.site/jgesc/koel"` |  |
| images.koel.tag | string | `"v6.7.2"` |  |
| koel.affinity | object | `{}` |  |
| koel.component | string | `"koel"` |  |
| koel.cronJob.restartPolicy | string | `"Never"` |  |
| koel.cronJob.schedule | string | `"*/15 * * * *"` |  |
| koel.deploymentAnnotations | object | `{}` |  |
| koel.ingress.annotations | object | `{}` |  |
| koel.ingress.enabled | bool | `false` |  |
| koel.ingress.hosts[0] | string | `"chart-example.local"` |  |
| koel.ingress.path | string | `"/"` |  |
| koel.ingress.tls | list | `[]` |  |
| koel.persistence.covers.accessMode | string | `"ReadWriteOnce"` |  |
| koel.persistence.covers.enabled | bool | `true` |  |
| koel.persistence.covers.size | string | `"20Gi"` |  |
| koel.persistence.covers.storageClass | string | `""` |  |
| koel.persistence.data.accessMode | string | `"ReadWriteOnce"` |  |
| koel.persistence.data.enabled | bool | `false` |  |
| koel.persistence.data.size | string | `"20Gi"` |  |
| koel.persistence.data.storageClass | string | `""` |  |
| koel.persistence.extraMounts | list | `[]` |  |
| koel.persistence.music.accessMode | string | `"ReadWriteOnce"` |  |
| koel.persistence.music.enabled | bool | `true` |  |
| koel.persistence.music.size | string | `"100Gi"` |  |
| koel.persistence.music.storageClass | string | `""` |  |
| koel.podAnnotations | object | `{}` |  |
| koel.podSecurityContext | object | `{}` |  |
| koel.probes.liveness.enabled | bool | `true` |  |
| koel.probes.liveness.failureThreshold | int | `10` |  |
| koel.probes.liveness.initialDelaySeconds | int | `30` |  |
| koel.probes.liveness.periodSeconds | int | `60` |  |
| koel.probes.readiness.enabled | bool | `false` |  |
| koel.probes.readiness.failureThreshold | int | `10` |  |
| koel.probes.readiness.initialDelaySeconds | int | `30` |  |
| koel.probes.readiness.periodSeconds | int | `60` |  |
| koel.probes.startup.enabled | bool | `false` |  |
| koel.probes.startup.failureThreshold | int | `30` |  |
| koel.probes.startup.initialDelaySeconds | int | `60` |  |
| koel.probes.startup.periodSeconds | int | `60` |  |
| koel.proxy.enabled | bool | `false` |  |
| koel.replicaCount | int | `1` |  |
| koel.resources | object | `{}` |  |
| koel.restartPodsOnConfigMapChange | bool | `false` |  |
| koel.service.annotations | object | `{}` |  |
| koel.service.defaultProtocol | string | `"https"` |  |
| koel.service.labels | object | `{}` |  |
| koel.service.loadBalancerIP | string | `nil` |  |
| koel.service.ports.http | int | `80` |  |
| koel.service.ports.https | int | `443` |  |
| koel.service.type | string | `"ClusterIP"` |  |
| koel.tolerations | list | `[]` |  |
| logChannel | string | `"stderr"` |  |
| mediaPath | string | `"/music"` |  |
| nameOverride | string | `""` |  |
| namespace | string | `"koel"` |  |
| namespaceCreate | bool | `false` |  |
| publicHttpPort | int | `80` |  |
| publicHttpsPort | int | `443` |  |
| securityContext | object | `{}` |  |
| strategyType | string | `"Recreate"` |  |
| streamingMethod | string | `"x-sendfile"` |  |
| timezone | string | `"UTC"` |  |

## Changelog

All notable changes to this application Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### [0.0.1]

#### Added

- Initial release

#### Changed

- use helm-docs

#### Removed

- N/A

[0.0.1]: #0.0.1

## Support
- Open an [issue](https://github.com/acjohnson/helm-charts/issues/new/choose)

## Attribution
This chart is heavily based on [k8s-at-home/plex](https://github.com/k8s-at-home/charts/tree/master/charts/plex) all credit goes to them.

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)