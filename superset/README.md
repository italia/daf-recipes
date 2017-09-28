#SUPERSET DOCKER GUIDE

git clone https://github.com/lorenzoeusepi77/superset_last.git

cd superset_last/docker/

# Configure LDAP parameter inside the configuration file "superset_config.py" before to build superset image 

	AUTH_TYPE = AUTH_LDAP
	AUTH_LDAP_SERVER = "ldaps://server:636"
	AUTH_LDAP_SEARCH = "cn=users,cn=accounts,dc=test,dc=example,dc=it"
	AUTH_LDAP_UID_FIELD = "uid"
	AUTH_LDAP_FIRSTNAME_FIELD = "givenName"
	AUTH_LDAP_LASTNAME_FIELD = "sn"
	AUTH_LDAP_EMAIL_FIELD = "mail"
	AUTH_LDAP_BIND_USER = "uid=admin,cn=users,cn=accounts,dc=test,dc=example,dc=it"
	AUTH_LDAP_BIND_PASSWORD = "password"
	AUTH_LDAP_ALLOW_SELF_SIGNED = True


./build.sh                                     #Build superset image


docker-compose up -d                           #Start superset - postgres - redis


./init.sh                                      #First time to create admin user (admin password) - initialize db - exmaple 


