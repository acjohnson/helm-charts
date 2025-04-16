# emby

![Version: 0.0.25](https://img.shields.io/badge/Version-0.0.25-informational?style=flat-square) ![AppVersion: 4.8.11.0](https://img.shields.io/badge/AppVersion-4.8.11.0-informational?style=flat-square)

Emby Server

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/acjohnson/helm-charts/issues/new/choose)**

## Source Code

* <https://github.com/acjohnson/helm-charts/tree/master/charts/emby>
* <https://hub.docker.com/r/emby/embyserver/>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|

## TL;DR

```console
helm repo add thejohnsons https://charts.thejohnsons.site
helm repo update
helm install emby thejohnsons/emby
```

## Installing the Chart

To install the chart with the release name `emby`

```console
helm install emby thejohnsons/emby
```

## Uninstalling the Chart

To uninstall the `emby` deployment

```console
helm uninstall emby
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install emby \
  --set env.TZ="America/New York" \
    thejohnsons/emby
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install emby thejohnsons/emby -f values.yaml
```

## Custom configuration

N/A

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| certificate.pkcsMangler.certificateSecret.crtName | string | `"tls.crt"` |  |
| certificate.pkcsMangler.certificateSecret.keyName | string | `"tls.key"` |  |
| certificate.pkcsMangler.certificateSecret.name | string | `""` |  |
| certificate.pkcsMangler.certificateSecret.volume.mountPath | string | `"/etc/emby-certs"` |  |
| certificate.pkcsMangler.certificateSecret.volume.name | string | `"emby-certs"` |  |
| certificate.pkcsMangler.configmap.annotations | object | `{}` |  |
| certificate.pkcsMangler.configmap.labels | object | `{}` |  |
| certificate.pkcsMangler.configmap.name | string | `"42-pkcs-mangler"` |  |
| certificate.pkcsMangler.enabled | bool | `false` |  |
| certificate.pkcsMangler.image.repository | string | `"tlsprint/openssl"` |  |
| certificate.pkcsMangler.image.tag | string | `"1.1.1f"` |  |
| certificate.pkcsMangler.pfxInContainerPath | string | `"/config/emby.pfx"` |  |
| certificate.pkcsMangler.pfxPassword.annotations | object | `{}` |  |
| certificate.pkcsMangler.pfxPassword.labels | object | `{}` |  |
| certificate.pkcsMangler.pfxPassword.passwordKey | string | `"pfx-password"` |  |
| certificate.pkcsMangler.pfxPassword.secretName | string | `"emby-server-pfx-password"` |  |
| certificate.pkcsMangler.pfxPassword.value | string | `"setpassword"` |  |
| certificate.pkcsMangler.volume.defaultMode | int | `493` |  |
| certificate.pkcsMangler.volume.mountPath | string | `"/etc/cont-init.d/42-pkcs-mangler"` |  |
| certificate.pkcsMangler.volume.name | string | `"42-pkcs-mangler"` |  |
| certificate.pkcsMangler.volume.subPath | string | `"42-pkcs-mangler"` |  |
| changeConfigDirOwnership | bool | `true` |  |
| deploymentAnnotations | object | `{}` |  |
| dnsExternalDomain | string | `"emby.example.com"` |  |
| embyGid | int | `2` |  |
| embyPreferences.configmap.annotations | object | `{}` |  |
| embyPreferences.configmap.labels | object | `{}` |  |
| embyPreferences.configmap.name | string | `"41-emby-preferences"` |  |
| embyPreferences.enabled | bool | `false` |  |
| embyPreferences.volume.defaultMode | int | `493` |  |
| embyPreferences.volume.mountPath | string | `"/etc/cont-init.d/41-emby-preferences"` |  |
| embyPreferences.volume.name | string | `"41-emby-preferences"` |  |
| embyPreferences.volume.subPath | string | `"41-emby-preferences"` |  |
| embyUid | int | `2` |  |
| enableHttps | bool | `false` |  |
| enableUpnp | bool | `true` |  |
| fullnameOverride | string | `""` |  |
| hostNetwork | bool | `false` |  |
| httpPort | int | `8096` |  |
| httpsHandledByReverseProxy | bool | `false` |  |
| httpsPort | int | `8920` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"emby/embyserver"` |  |
| image.tag | string | `"4.8.11.0"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| logging.promtail.enabled | bool | `false` |  |
| logging.promtail.image.pullPolicy | string | `"IfNotPresent"` |  |
| logging.promtail.image.repository | string | `"grafana/promtail"` |  |
| logging.promtail.image.tag | string | `"1.6.0"` |  |
| logging.promtail.loki.url | string | `"http://loki.logs.svc.cluster.local:3100/loki/api/v1/push"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.config.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.config.size | string | `"20Gi"` |  |
| persistence.config.storageClass | string | `""` |  |
| persistence.data.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.data.enabled | bool | `true` |  |
| persistence.data.size | string | `"40Gi"` |  |
| persistence.data.storageClass | string | `""` |  |
| persistence.extraData | list | `[]` |  |
| persistence.extraMounts | list | `[]` |  |
| persistence.transcode.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.transcode.emptyDir.medium | string | `""` |  |
| persistence.transcode.enabled | bool | `false` |  |
| persistence.transcode.size | string | `"20Gi"` |  |
| persistence.transcode.storageClass | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.failureThreshold | int | `5` |  |
| probes.liveness.httpGet.path | string | `"/"` |  |
| probes.liveness.httpGet.port | int | `8096` |  |
| probes.liveness.periodSeconds | int | `10` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.failureThreshold | int | `5` |  |
| probes.readiness.httpGet.path | string | `"/"` |  |
| probes.readiness.httpGet.port | int | `8096` |  |
| probes.readiness.periodSeconds | int | `10` |  |
| probes.startup.enabled | bool | `true` |  |
| probes.startup.failureThreshold | int | `30` |  |
| probes.startup.httpGet.path | string | `"/"` |  |
| probes.startup.httpGet.port | int | `8096` |  |
| probes.startup.initialDelaySeconds | int | `5` |  |
| probes.startup.periodSeconds | int | `10` |  |
| proxy.enabled | bool | `false` |  |
| publicHttpPort | int | `8096` |  |
| publicHttpsPort | int | `8920` |  |
| requireHttps | bool | `false` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| serviceTCP.annotations | object | `{}` |  |
| serviceTCP.defaultProtocol | string | `"http"` |  |
| serviceTCP.labels | object | `{}` |  |
| serviceTCP.loadBalancerIP | string | `nil` |  |
| serviceTCP.ports.http | int | `8096` |  |
| serviceTCP.ports.https | int | `8920` |  |
| serviceTCP.type | string | `"ClusterIP"` |  |
| skipSetupWizard | bool | `false` |  |
| strategyType | string | `"Recreate"` |  |
| timezone | string | `"UTC"` |  |
| tolerations | list | `[]` |  |
| uiLanguage | string | `"en-us"` |  |

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