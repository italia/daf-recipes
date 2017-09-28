# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# Configuration file for JupyterHub
import os

c = get_config()


# We rely on environment variables to configure JupyterHub so that we
# avoid having to rebuild the JupyterHub container every time we change a
# configuration parameter.
# User containers will access hub by container name on the Docker network
#c.JupyterHub.hub_ip = 'jupyterhub'
#c.JupyterHub.hub_port = 8000

# TLS config
#c.JupyterHub.port = 443
#c.JupyterHub.ssl_key = os.environ['SSL_KEY']
#c.JupyterHub.ssl_cert = os.environ['SSL_CERT']

#Add admin user
c.Authenticator.admin_users = {'admin','lorenzo'}
#c.Authenticator.whitelist = {'lorenzo', 'pippo'}
c.JupyterHub.admin_access = True


#Proxy authentication token
c.JupyterHub.proxy_auth_token = '0bc02bede919e99a26de1e2a7a5aadfaf6228de836ec39a05a6c6942831d8fe5'

c.JupyterHub.cookie_secret = bytes.fromhex('3a428b49012544f2d65c3d320f45a351b2e8dd80ac68ce27e45caf1b8971a894')

# Set the log level by value or name.
c.JupyterHub.log_level = 'DEBUG'

# Enable debug-logging of the single-user server
c.Spawner.debug = True


#Postgres Config
c.JupyterHub.db_url = 'postgresql://{user}:{password}@{host}/{db}'.format(
    host=os.environ['POSTGRES_HOST'],
    password=os.environ['POSTGRES_PASSWORD'],
    db=os.environ['POSTGRES_DB'],
    user=os.environ['POSTGRES_USER']
)




# LDAP Config
c.JupyterHub.authenticator_class = 'ldapcreateusers.LocalLDAPCreateUsers'
c.LocalLDAPCreateUsers.create_system_users = True

#ldap Server config
c.LDAPAuthenticator.server_address = 'server ip'
c.LDAPAuthenticator.use_ssl = True
c.LDAPAuthenticator.server_port = 636
c.LDAPAuthenticator.bind_dn_template = 'uid={username},cn=users,cn=accounts,dc=test,dc=example,dc=com'
