#!/bin/bash
set -e

host="$1"
#shift
#cmd="$@"

echo "************************************* SONO ENTRATO *************************************"
>&2 echo "************************************* SONO ENTRATO *************************************"


echo $host

until PGPASSWORD="jupyterhub" psql -h "$host" -U "jupyterhub" -c '\l'; do
#until PGPASSWORD="jupyterhub" psql -h "postgresjupyterhub:5432" -U "jupyterhub" -c '\l'; do
  >&2 echo "************************************* SONO IN LOOP *************************************"
  echo "************************************* SONO IN LOOP *************************************"
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

#>&2 echo "Postgres is up - executing command"
jupyterhub
