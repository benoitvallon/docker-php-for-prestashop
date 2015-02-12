FROM php:5.6-apache

COPY php.ini /usr/local/etc/php/

RUN a2enmod rewrite

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libmcrypt-dev libpng12-dev libjpeg-dev
RUN docker-php-ext-install pdo_mysql mcrypt gd mbstring

CMD ["apache2-foreground"]
