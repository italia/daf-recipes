#!/bin/bash

set -e

# Install superset
#pip install superset

# Create an admin user
#fabmanager create-admin --app superset $@
fabmanager create-admin --app superset --username admin --firstname admin --lastname admin --email admin@fab.it --password password

# Initialize the database
superset db upgrade

# Initialize Caravel
#superset-init

# Load some data to play with
superset load_examples

# Create default roles and permissions
superset init

## Start the web server on port 8088, use -p to bind to another port
#superset runserver

# To start a development web server, use the -d switch
# superset runserver -d
