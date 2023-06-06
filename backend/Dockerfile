FROM php:8.2-fpm-alpine

RUN set -ex \
    && apk add postgresql-dev yarn libzip-dev\
    &&  docker-php-ext-install pdo pdo_pgsql\
    && docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

COPY . .

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod 664 /var/www/html/composer.json
RUN composer install --no-interaction --no-dev --prefer-dist 
RUN php artisan migrate:fresh --seed --force --no-interaction
EXPOSE 8080

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]