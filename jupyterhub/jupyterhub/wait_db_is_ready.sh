#!/bin/bash
set -e

#until PGPASSWORD="jupyterhub" psql -h "$host" -U "jupyterhub" -c '\l'; do
until PGPASSWORD="$POSTGRES_PASSWORD" psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - starting now jupyterhub"
jupyterhub
