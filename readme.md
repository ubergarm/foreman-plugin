docker foreman plugin
=====
A quick and dirty concept for having one container run all your other containers.
This isn't working quite yet, but is a model which could use some discussion.

Leverage the `Procfile` and `.env` to create similar development and production environments.

## Test Stack
Bring up the test app for about 10 seconds:

    docker run --name foreman \
               --rm \
               -it \
               -v /var/run/docker.sock:/var/run/docker.sock \
               -v `which docker`:/usr/bin/docker \
               -v `pwd`/develop.env:/.env \
               -v `pwd`/Procfile:/Procfile \
               ubergarm/foreman-plugin foreman start 

Now curl the ip address from another terminal:

    curl 172.17.0.2

## Production Stack
This doesn't work yet but something like this.

Export to `supervisord` format to run the same stack in development.

    CMD foreman export supervisord /etc/supervisor/conf.d \
                               -a my_app \
                               -u my_prod_user \
                               -l syslog && \
        supervisord -n -l syslog -c /etc/supervisor/supervisord.conf

## TODO
1. Get logs out using [logspout](https://github.com/progrium/logspout) etc.
2. Get logs in using syslog (foreman doesn't actually work with the above statement).
3. Everything.
