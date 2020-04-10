#!/usr/bin/env sh

AUTH_TOKEN=$1
SITE_ID=$2
DEPLOY_PROD=$3
BUILD_DIRECTORY='/github/home/build'

if [ -z $DEPLOY_PROD ]; then
    netlify deploy --dir ${BUILD_DIRECTORY} --site=${SITE_ID} --auth=${AUTH_TOKEN} --timeout=600 --message "Deployed on $(date)"
else
    netlify deploy --prod --dir ${BUILD_DIRECTORY} --site=${SITE_ID} --auth=${AUTH_TOKEN} --timeout=600 --message "Deployed on $(date)"
fi
