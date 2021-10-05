# Open Streaming Platform

![Version: 0.8.16](https://img.shields.io/badge/Version-0.8.16-informational?style=flat-square)

Open Streaming Platform helm chart

## Source Code

* <https://github.com/acjohnson/helm-charts/tree/master/charts/osp>
* <https://gitlab.com/Deamos/open-streaming-platform-docker/>

## Installing the Chart

To install the chart with the release name `osp`
Note: regcred.yaml is only required if you plan to use a private docker registry. Also you'll want to customize ejabberd.yml and put it in a `configmap` as shown below

```console
helm repo add thejohnsons https://charts.thejohnsons.site
helm repo update
```

```console
kubectl -n osp create -f regcred.yaml
kubectl -n osp create configmap osp-osp-ejabberd-app-config --from-file=ejabberd.yml

helm -n osp upgrade osp \
  --install \
  --set images.osp_ejabberd.pullPolicy="Always" \
  --set images.osp_core.pullPolicy="Always" \
  --set images.osp_rtmp.pullPolicy="Always" \
  --set imagePullSecret="regcred" \
  --set osp_ejabberd.password="changeme" \
  --set osp_ejabberd.customConfig="true" \
  --set osp_ejabberd.volumes.data.local_storage=false \
  --set osp_ejabberd.volumes.data.accessMode="ReadWriteMany" \
  --set osp_ejabberd.volumes.data.storageClassName="nfs-client" \
  --set osp_core.flask.secret="changeme" \
  --set osp_core.flask.salt="changeme" \
  --set osp_core.ingress.enabled=true \
  --set osp_core.ingress.hostname=streams.example.com \
  --set osp_core.ingress.tls.enabled=true \
  --set osp_core.ingress.tls.secretName="streams-example-com-tls" \
  --set osp_core.ingress.annotations."nginx\.ingress\.kubernetes\.io/rewrite-target"="/" \
  --set osp_core.ingress.annotations."cert-manager\.io/cluster-issuer"="letsencrypt-production" \
  --set osp_core.ingress.annotations."kubernetes\.io/ingress\.class"="nginx" \
  --set-string osp_core.ingress.annotations."kubernetes\.io/tls-acme"="true" \
  --set-string osp_core.ingress.annotations.'nginx\.ingress\.kubernetes\.io/force-ssl-redirect'="true" \
  --set osp_core.volumes.data.local_storage=false \
  --set osp_core.volumes.data.accessMode="ReadWriteMany" \
  --set osp_core.volumes.data.storageClassName="nfs-client" \
  --set osp_core.configData.TZ="UTC" \
  --set osp_core.configData.EJABBERD_DOMAIN="streams.example.com" \
  --set osp_core.configData.OSPCOREAPI="https://streams.example.com" \
  --set osp_core.configData.OSP_SERVER_ADDRESS="streams.example.com" \
  --set osp_core.configData.OSP_API_PROTOCOL="https" \
  --set osp_core.configData.OSP_API_DOMAIN="streams.example.com" \
  --set-string osp_core.configData.OSP_ALLOWREGISTRATION="True" \
  --set-string osp_core.configData.OSP_REQUIREVERIFICATION="True" \
  --set osp_db.db_name="osp" \
  --set osp_db.db_root_password="changeme" \
  --set osp_db.db_user.user="osp" \
  --set osp_db.db_user.password="changeme" \
  --set osp_db.volumes.data.local_storage=false \
  --set osp_db.volumes.data.accessMode="ReadWriteOnce" \
  --set osp_db.volumes.data.storageClassName="nfs-client" \
  --set osp_db.probe.liveness.enabled=true \
  thejohnsons/osp
```

## Uninstalling the Chart

To uninstall the `osp` deployment

```console
helm -n osp uninstall osp
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.

## Upgrading

After upgrading the helm chart you will likely need to drop the `alembic_version` table before the database migrations will succeed.

```shell
MariaDB [osp]> select * from alembic_version;
+--------------+
| version_num  |
+--------------+
| fb1a7bec5a9d |
+--------------+
1 row in set (0.000 sec)

MariaDB [osp]> drop table alembic_version;
Query OK, 0 rows affected (0.155 sec)
```

Drop the table as shown, then exec a shell in the osp-core pod, delete the migrations directory and manually re-run the migration/upgrade script

```shell
# kubectl -n osp-personal exec -it pod/osp-personal-osp-core-849c474555-nrvds -- /bin/bash

bash-5.1# cd /opt/osp
bash-5.1# rm -rf migrations/
bash-5.1# python3 manage.py db init
bash-5.1# python3 manage.py db migrate 
bash-5.1# python3 manage.py db upgrade
```

## Support
- Open an [issue](https://github.com/acjohnson/helm-charts/issues/new/choose)
