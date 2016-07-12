#!/bin/bash

# Modeled on:
#
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/

set -e

if [ "$1" = 'couchdb' ]; then
    # Apply our admin user/password and put local.ini in the correct location
    python /docker-couchdb-temp/apply_secrets.py

    exec tini -- /docker-entrypoint.sh "$@"
fi

exec "$@"
