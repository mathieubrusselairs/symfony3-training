FROM php:7.2-apache

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libicu-dev \
    && docker-php-ext-install -j$(nproc) iconv intl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install pdo_mysql exif zip

RUN cp /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load

RUN rmdir /var/www/html

RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip

RUN curl --silent --show-error https://getcomposer.org/installer | php
RUN cp /var/www/html/composer.phar /usr/bin/composer

COPY docker/php/short_open_tags.ini /usr/local/etc/php/conf.d/short_open_tags.ini
COPY docker/php/display_errors.ini /usr/local/etc/php/conf.d/display_errors.ini
COPY docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

COPY . /var/www

RUN cd /var/www && composer install

WORKDIR /var/www
