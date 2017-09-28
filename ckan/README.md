# CKAN Docker based infrastructure + LDAP Integration

This project provides everything you need to run ckan plus a set of plugins for supporting Italian open data. It has been currently used only in testing environments but we think it can provide a good base for running a production service (please feel free to contribute with pull requests to this end). 

## Docker containers for ckan + plugin dcat + dcat-ap-it

## Container images details:

	- Ckan 2.6.2
		Extensions:
		0	"stats"
		1	"text_view"
		2	"image_view"
		3	"recline_view"
		4	"harvest"
		5	"ckan_harvester"
		6	"dcat"
		7	"dcat_rdf_harvester"
		8	"dcat_json_harvester"
		9	"dcat_json_interface"
		10	"dcatapit_pkg"
		11	"dcatapit_org"
		12	"dcatapit_config"
		13	"dcatapit_harvester"
		14      "ckan ldap"

	- Solr 6.2.1

	- Redis server v=4.0.0 sha=00000000:0 malloc=jemalloc-4.0.3 bits=64 build=77e2b28390619b67

	- PostgreSQL 9.6

### LDAP Integration
For ldap integration you need to insert parameter of your ldap server inside the ckan.ini configuration file before build images.

Configuration of an LDAP client is always tricky. Unfortunately this really varies from system to system - we cannot provide general advice, you need to check with the LDAP server administrator.

The plugin provides the following required configuration items:

    ckanext.ldap.uri: The URI of the LDAP server, of the form ldap://example.com. You can use the URI to specify TLS (use 'ldaps' protocol), and the port number (suffix ':port');
    ckanext.ldap.auth.dn: If your LDAP server requires authentication (eg. Active Directory), this should be the DN to use;
    ckanext.ldap.auth.password: If your LDAP server requires authentication, add the password here;
    ckanext.ldap.base_dn: The base dn in which to perform the search. Example: 'ou=USERS,dc=example,dc=com';
    ckanext.ldap.search.filter: This is the search string that is sent to the LDAP server, in which '{login}' is replaced by the user name provided by the user. Example: 'sAMAccountName={login}'. The search performed here must return exactly 0 or 1 entry. See ckanext.ldap.search.alt to provide search on alternate fields;
    ckanext.ldap.username: The LDAP attribute that will be used as the CKAN username. This must be unique;
    ckanext.ldap.email: The LDAP attribute to map to the user's email address. This must be unique.
    ckanext.ldap.ckan_fallback: If defined and true this will attempt to log in against the CKAN user database when no LDAP user exists;


### Follow these steps to run the Docker images:

1. git clone https://github.com/lorenzoeusepi77/ckan_last.git
2. cd ckan_last/docker/
3. ./build_local.sh #it will build the images needed by docker-compoose
4. docker-compose up -d # it will run all the needed containers
5. ./init.sh # it will configure the plugins and it will create all the vocabolaries

Then you can open the ckan home [http://localhost:5000](http://localhost:5000).
The init.sh script creates an admin user with the following credentials: ckanadmin/ckanpassword


### CKAN Harvest
[http://localhost:5000/harvest](http://localhost:5000/harvest)

Ckan starts automatically the harvesting function.

You can see logs during harvesting import with following command:

> docker logs ckan -f

If there is some error during harvesting you can connect to the docker container,
verify if some process are dead and restart the harvesting processes with following commands:

Connect to ckan container and verify the processes:

> docker exec -it ckan /bin/bash

Once in the container run:

> ps -ef

You need to find both these processes as output of the "ps -ef" command:

> /usr/bin/python /usr/local/bin/paster --plugin=ckanext-harvest harvester gather_consumer -c /etc/ckan/default/ckan.ini

> /usr/bin/python /usr/local/bin/paster --plugin=ckanext-harvest harvester fetch_consumer -c /etc/ckan/default/ckan.ini


If one of those processes is missing you can restart it with the following commands:

> . /usr/lib/ckan/default/bin/activate

Then:

Either

> nohup paster --plugin=ckanext-harvest harvester gather_consumer --config /etc/ckan/default/ckan.ini &

Or (you can run both in case both processes are missing)

> nohup paster --plugin=ckanext-harvest harvester fetch_consumer --config /etc/ckan/default/ckan.ini &
