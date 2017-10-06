import os
#ADDED
from flask_appbuilder.security.manager import AUTH_OID, AUTH_REMOTE_USER, AUTH_DB, AUTH_LDAP, AUTH_OAUTH

# Superset specific config
#---------------------------------------------------------
ROW_LIMIT = 5000
SUPERSET_WORKERS = 4
SUPERSET_WEBSERVER_PORT = 8088
#SUPERSET_WEBSERVER_TIMEOUT = 60

## Flask-WTF flag for CSRF
WTF_CSRF_ENABLED = False

# Set this API key to enable Mapbox visualization
#MAPBOX_API_KEY = ‘Miakey’
MAPBOX_API_KEY = os.getenv('MAPBOX_API_KEY', '')

# Cache config
CACHE_CONFIG = {
    'CACHE_TYPE': 'redis',
    'CACHE_DEFAULT_TIMEOUT': 300,
    'CACHE_KEY_PREFIX': 'superset_',
    'CACHE_REDIS_HOST': 'redissuperset',
    'CACHE_REDIS_PORT': 6379,
    'CACHE_REDIS_DB': 1,
    'CACHE_REDIS_URL': 'redis://redissuperset:6379/1'}

# Postgres DB config
SQLALCHEMY_DATABASE_URI = \
    'postgresql+psycopg2://superset:superset@postgressuperset:5432/superset'

SQLALCHEMY_TRACK_MODIFICATIONS = False

SECRET_KEY = 'wifbeiaufkdb29475jfdbskfrh493hdb'

# Proxy for Load Balancer
ENABLE_PROXY_FIX = True

# Debug option
DEBUG = False
LOG_LEVEL = 'DEBUG'

# ----------------------------------------------------
# AUTHENTICATION CONFIG
# ----------------------------------------------------
# The authentication type
# AUTH_OID : Is for OpenID
# AUTH_DB : Is for database (username/password()
# AUTH_LDAP : Is for LDAP
# AUTH_REMOTE_USER : Is for using REMOTE_USER from web server
#AUTH_TYPE = AUTH_DB

# Uncomment to setup Full admin role name
AUTH_ROLE_ADMIN = 'Admin'

# Uncomment to setup Public role name, no authentication needed
# AUTH_ROLE_PUBLIC = 'Public'

# Will allow user self registration
# AUTH_USER_REGISTRATION = True

# The default user self registration role
# AUTH_USER_REGISTRATION_ROLE = "Public"
AUTH_USER_REGISTRATION_ROLE = "Admin"
# Uncomment this below for the default role assignment of the OpenData part
#AUTH_USER_REGISTRATION_ROLE = "AlphaOpen"

#AUTH CONFIG LDAP AND DB AUTH cannot be used both at the same time
# When using Local DB AUTH uncomment following parameter and comment "AUTH_LDAP"
#AUTH_TYPE = AUTH_DB

# When using LDAP Auth, setup the ldap server
AUTH_TYPE = AUTH_LDAP
AUTH_LDAP_SERVER = "ldap://freeipa.daf.test.it:389"
AUTH_LDAP_SEARCH = "cn=users,cn=accounts,dc=daf,dc=test,dc=it"
AUTH_LDAP_UID_FIELD = "uid"
AUTH_LDAP_FIRSTNAME_FIELD = "givenName"
AUTH_LDAP_LASTNAME_FIELD = "sn"
AUTH_LDAP_EMAIL_FIELD = "mail"
AUTH_LDAP_BIND_USER = "uid=admin,cn=users,cn=accounts,dc=daf,dc=test,dc=it"
AUTH_LDAP_BIND_PASSWORD = "aiyaiPh8"
AUTH_LDAP_ALLOW_SELF_SIGNED = True

# ---------------------------------------------------
# Roles config
# ---------------------------------------------------
# Grant public role the same set of permissions as for the GAMMA role.
# This is useful if one wants to enable anonymous users to view
# dashboards. Explicit grant on specific datasets is still required.
#PUBLIC_ROLE_LIKE_GAMMA = False

# ---------------------------------------------------
# Babel config for translations
# ---------------------------------------------------
# Setup default language
BABEL_DEFAULT_LOCALE = 'en'
# Your application default translation path
BABEL_DEFAULT_FOLDER = 'babel/translations'
# The allowed translation for you app
LANGUAGES = {
    'en': {'flag': 'us', 'name': 'English'},
    'it': {'flag': 'it', 'name': 'Italian'},
    # 'fr': {'flag': 'fr', 'name': 'French'},
    # 'zh': {'flag': 'cn', 'name': 'Chinese'},
}
