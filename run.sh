docker run --name foreman \
           --rm \
           -it \
           -v /var/run/docker.sock:/var/run/docker.sock \
           -v `which docker`:/usr/bin/docker \
           -v `pwd`/develop.env:/.env \
           -v `pwd`/Procfile:/Procfile \
           ubergarm/foreman-plugin foreman start 
