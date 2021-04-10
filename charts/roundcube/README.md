# roundcube

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![AppVersion: v1.4.11](https://img.shields.io/badge/AppVersion-v1.4.11-informational?style=flat-square)

Roundcube

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/acjohnson/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/acjohnson/helm-charts/tree/master/charts/roundcube>
* <https://github.com/roundcube/roundcubemail-docker>
* <https://github.com/roundcube/roundcubemail>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add thejohnsons https://charts.thejohnsons.site
helm repo update
helm install roundcube thejohnsons/roundcube
```

## Installing the Chart

To install the chart with the release name `roundcube`

```console
helm install roundcube thejohnsons/roundcube
```

## Uninstalling the Chart

To uninstall the `roundcube` deployment

```console
helm uninstall roundcube
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install roundcube \
  --set timezone="America/New York" \
    thejohnsons/roundcube
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install roundcube thejohnsons/roundcube -f values.yaml
```

## Custom configuration

N/A

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| components.database | bool | `true` |  |
| components.roundcube | bool | `true` |  |
| customConfigIncPhp | string | `nil` |  |
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
| dbName | string | `"roundcubemail"` |  |
| dbPassword | string | `"changeme"` |  |
| dbRootPassword | string | `"changeme"` |  |
| dbType | string | `"mysql"` |  |
| dbUsername | string | `"roundcube"` |  |
| defaultHost | string | `"ssl://localhost"` |  |
| defaultPort | int | `993` |  |
| desKey | string | `"abcdefghijklmnopqrstuvwx"` |  |
| enableInstaller | bool | `false` |  |
| enableSpellcheck | bool | `true` |  |
| forceHttps | string | `""` |  |
| fullnameOverride | string | `""` |  |
| hostNetwork | bool | `false` |  |
| httpPort | int | `80` |  |
| httpsPort | int | `443` |  |
| imagePullSecrets | list | `[]` |  |
| images.database.pullPolicy | string | `"IfNotPresent"` |  |
| images.database.repository | string | `"mariadb"` |  |
| images.database.tag | string | `"10.5.8"` |  |
| images.roundcube.pullPolicy | string | `"IfNotPresent"` |  |
| images.roundcube.repository | string | `"registry.thejohnsons.site/debianbased"` |  |
| images.roundcube.tag | string | `"roundcube"` |  |
| logDriver | string | `"stdout"` |  |
| nameOverride | string | `""` |  |
| namespace | string | `"roundcube"` |  |
| namespaceCreate | bool | `false` |  |
| plugins | string | `"archive,zipdownload,password"` |  |
| productName | string | `"Roundcube Webmail"` |  |
| publicHttpPort | int | `80` |  |
| publicHttpsPort | int | `443` |  |
| roundcube.affinity | object | `{}` |  |
| roundcube.component | string | `"roundcube"` |  |
| roundcube.deploymentAnnotations | object | `{}` |  |
| roundcube.ingress.annotations | object | `{}` |  |
| roundcube.ingress.enabled | bool | `false` |  |
| roundcube.ingress.hosts[0] | string | `"chart-example.local"` |  |
| roundcube.ingress.path | string | `"/"` |  |
| roundcube.ingress.tls | list | `[]` |  |
| roundcube.persistence.data.accessMode | string | `"ReadWriteOnce"` |  |
| roundcube.persistence.data.enabled | bool | `false` |  |
| roundcube.persistence.data.size | string | `"20Gi"` |  |
| roundcube.persistence.data.storageClass | string | `""` |  |
| roundcube.persistence.extraMounts | list | `[]` |  |
| roundcube.podAnnotations | object | `{}` |  |
| roundcube.podSecurityContext | object | `{}` |  |
| roundcube.probes.liveness.enabled | bool | `true` |  |
| roundcube.probes.liveness.failureThreshold | int | `10` |  |
| roundcube.probes.liveness.initialDelaySeconds | int | `30` |  |
| roundcube.probes.liveness.periodSeconds | int | `60` |  |
| roundcube.probes.readiness.enabled | bool | `false` |  |
| roundcube.probes.readiness.failureThreshold | int | `10` |  |
| roundcube.probes.readiness.initialDelaySeconds | int | `30` |  |
| roundcube.probes.readiness.periodSeconds | int | `60` |  |
| roundcube.probes.startup.enabled | bool | `false` |  |
| roundcube.probes.startup.failureThreshold | int | `30` |  |
| roundcube.probes.startup.initialDelaySeconds | int | `60` |  |
| roundcube.probes.startup.periodSeconds | int | `60` |  |
| roundcube.proxy.enabled | bool | `false` |  |
| roundcube.replicaCount | int | `1` |  |
| roundcube.resources | object | `{}` |  |
| roundcube.restartPodsOnConfigMapChange | bool | `false` |  |
| roundcube.service.annotations | object | `{}` |  |
| roundcube.service.defaultProtocol | string | `"http"` |  |
| roundcube.service.labels | object | `{}` |  |
| roundcube.service.loadBalancerIP | string | `nil` |  |
| roundcube.service.ports.http | int | `80` |  |
| roundcube.service.ports.https | int | `443` |  |
| roundcube.service.type | string | `"ClusterIP"` |  |
| roundcube.tolerations | list | `[]` |  |
| securityContext | object | `{}` |  |
| skin | string | `"elastic"` |  |
| smtpPort | int | `587` |  |
| smtpServer | string | `"tls://localhost"` |  |
| spellcheckDictionary | bool | `false` |  |
| spellcheckEngine | string | `"googie"` |  |
| spellcheckUri | string | `""` |  |
| strategyType | string | `"Recreate"` |  |
| timezone | string | `"UTC"` |  |
| uploadMaxFilesize | string | `"50M"` |  |
| useHttps | bool | `false` |  |

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
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
