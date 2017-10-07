Triple Store
==========

As triple store we use [Virtuoso](https://virtuoso.openlinksw.com/) and this docker-compose is based on [tenforce/docker-virtuoso](https://github.com/tenforce/docker-virtuoso).
To start the docker instance change the default password in the docker-compose file and type the following command:

```bash
$ docker-compose up -d

```

By default the instance is connected to the default host network via *bridge*.
Check that the service is running via `docker-compose ps`.

You can access to the web-ui of the service clicking [here](http://localhost:8890) and log to the conductor admin issuing username and password.
