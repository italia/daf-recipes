FROM osixia/openldap

# Init script spark magic
ADD ./ldap_conf/users.ldif /var/lib/ldap/ldif/

#RUN ldapadd -x -D "cn=admin,dc=example,dc=org" -w password -H ldap:// -f /var/lib/ldap/ldif/

EXPOSE 389 636
#ENTRYPOINT ["jupyterhub"]

USER root
