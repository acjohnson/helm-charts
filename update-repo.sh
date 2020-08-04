#!/bin/bash

# Get current appstack helm chart version
export APPSTACK_VERSION=$(helm inspect chart appstack | grep version | awk '{print $2}')
export CHART_ARCHIVE="appstack-${APPSTACK_VERSION}.tgz"
export HELM_REPO_URL="https://acjohnson.github.io/helm-charts"

curl --output /dev/null --silent --head --fail $HELM_REPO_URL/appstack-$APPSTACK_VERSION.tgz

if [ $? -eq 0 ]; then
  echo "${CHART_ARCHIVE} already exists, skipping helm package and publish..."
  echo "Did you forget to increment the version field in Chart.yaml?"
  exit 0
fi

# Generate new helm package
git checkout -b gh-pages remotes/origin/gh-pages
git pull origin master --rebase
helm package appstack
rm -f appstack-latest.tgz
cp -p appstack-$APPSTACK_VERSION.tgz appstack-latest.tgz
helm repo index . --url $HELM_REPO_URL
git add index.yaml
git add *.tgz
git add */Chart.yaml
git commit -am "Uprev helm charts"
git push origin +gh-pages
