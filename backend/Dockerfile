FROM php:8.2-fpm-alpine

RUN set -ex \
    && apk --no-cache add postgresql-dev nodejs yarn\
    &&  docker-php-ext-install pdo pdo_pgsql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

COPY . .

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod 664 /var/www/html/composer.json

EXPOSE 8000


CMD ["php-fpm"]
