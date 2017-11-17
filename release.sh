#!/bin/bash

set -e

version=$1
if [ $# -eq 0 ]
  then
    echo "Please supply the version to release as the first argument" && exit 1
fi

echo "injection version: $version into env"
sed -i "s/JIRA_VERSION=.*/JIRA_VERSION=$version/g" .env

echo "injection version: $version into Dockerfile"
sed -i "s/ARG JIRA_VERSION=.*/ARG JIRA_VERSION=$version/g" Dockerfile
cp Dockerfile Dockerfile_de

echo "preparing german release Dockerfile_de"
sed -i "s/ARG LANG_LANGUAGE=.*/ARG LANG_LANGUAGE=de/g" Dockerfile_de
sed -i "s/ARG LANG_COUNTRY=.*/ARG LANG_COUNTRY=DE/g" Dockerfile_de

echo "tagging with $version"
git add .env
git add Dockerfile
git add Dockerfile_de
git commit -am "releasing $version"
git tag $version
git push && git push --tags
