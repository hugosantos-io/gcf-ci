#!/bin/sh

# Authenticate using the service account stored variables
if [ -n $NPM_TOKEN ]
then
  echo "Authenticating NPM..."
  echo "//registry.npmjs.org/:_authToken=$NPM_TOKEN" > $HOME/.npmrc
fi

echo $GCLOUD_SERVICE_KEY > $HOME/gcloud-service-key.json

echo "Authenticating..."
gcloud auth activate-service-account --key-file=$HOME/gcloud-service-key.json

echo "Setting default project..."
gcloud config set project $GCP_PROJECT_ID