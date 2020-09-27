ARG PHP_VERSION=7.4
FROM php:${PHP_VERSION}-fpm-alpine

RUN apk update && \
    apk add less wget curl git fish
RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    curl-dev \
    imagemagick-dev \
    libtool \
    libxml2-dev \
    postgresql-dev \
    sqlite-dev
RUN apk add --no-cache \
    imagemagick \
    oniguruma-dev \
    mysql-client postgresql-libs \
    libintl icu icu-dev libzip-dev
RUN pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install bcmath curl iconv mbstring \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql pdo_sqlite \
    && docker-php-ext-install pcntl tokenizer xml zip intl
RUN apk del -f .build-deps

RUN apk add nodejs npm yarn

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

ARG GROUP_ID
ARG USER_ID
ARG user=app
RUN addgroup -g $GROUP_ID -S $user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --ingroup $user $user
USER $user
RUN composer g require hirak/prestissimo laravel/installer

WORKDIR /app
