#!/usr/bin/env bash

mkdir -p db

docker run -p 389:389 -v "$PWD/db:/var/lib/ldap"\
 -e LDAP_DOMAIN=mycorp.com\
 -e LDAP_ROOTPASS=1234abc\
 --name=fake_ldap
 --network=bridge -d nickstenning/slapd
