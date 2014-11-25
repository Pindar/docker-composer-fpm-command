docker-composer-fpm-command
===========================

Run composer on fpm within a docker container

So instead of running

    $ composer install

You can run 

    $ docker run -ti -v `pwd`:/app pindar/composer-fpm-command bash -c 'php /usr/local/bin/composer install'

The entrypoint is voluntarily omitted to ease user manipulation in the container in order to have composer generate files with the correct user rights.
