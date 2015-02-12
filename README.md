docker-php-for-prestashop
================

Base docker image to run Prestashop (Apache with all php extensions for prestashop installed)

Building the base image
-----------------------

To create the base image `benoitvallon/docker-php-for-prestashop`, execute the following command on the docker-php-for-prestashop folder:

    docker build -t benoitvallon/docker-php-for-prestashop .

Running the docker image
------------------------------------

Start your image binding the external port 80, with your own php code in `/your-code-folder` and a container running mysql named `your-mysql-container`:

    docker run -d -p 80:80 --name docker-php-for-prestashop \
        --link your-mysql-container:mysql \
        -v /your-code-folder:/var/www/html \
        benoitvallon/docker-php-for-prestashop

Running the docker image with docker-compose
------------------------------------

    yourprestashop:
        image: benoitvallon/docker-php-for-prestashop
        restart: always
        ports:
          - "80:80"
        links:
          - your-mysql-container:mysql
        volumes:
          - /your-code-folder:/var/www/html
