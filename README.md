# helm-charts
Helm Charts

# Install repo
```
helm repo add helm-charts https://acjohnson.github.io/helm-charts
```

# Install chart
Example helm install command, refer to values.yaml to determine which variables to override in your deployment
```
helm install appstack --name <release_name> --set "image.repository=<repo_url>,image.tag=<image_tag>,livenessProbe.initialDelaySeconds=30,readinessProbe.initialDelaySeconds=60"
