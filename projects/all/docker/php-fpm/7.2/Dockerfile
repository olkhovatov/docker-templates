FROM php:7.2-fpm

ARG USER_ID
ARG GROUP_ID

RUN apt-get update && apt-get install -y \
     wget \
     unzip \

     libfreetype6-dev \
     libjpeg62-turbo-dev \
     libxml2-dev \
     libmagickwand-dev \
     libpng-dev \
     libwebp-dev \
     libxpm-dev \
     libxslt-dev \
     libzip-dev \
     zlib1g-dev \
     libmemcached-dev \
     libgeoip-dev \
     libjpeg-dev \
     libicu-dev \
     libmagickwand-dev \
&& echo '---'

RUN docker-php-ext-install \
     bcmath \
     bz2 \
     exif \
     gettext \
     mysqli \
     opcache \ 
     pcntl \
     pdo_mysql \
     soap \
     sockets \
     xsl \
     zip \

&& docker-php-ext-configure intl \
&& docker-php-ext-install intl \

&& pecl install imagick \
&& docker-php-ext-enable imagick \

&& pecl install redis \
&& docker-php-ext-enable redis \

&& pecl install memcached \
&& docker-php-ext-enable memcached \

&& docker-php-ext-configure gd \
    --with-gd \
    --with-webp-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib-dir \
    --with-xpm-dir \
    --with-freetype-dir \
&& docker-php-ext-install gd \

&& pecl install xdebug-2.9.5 \
&& docker-php-ext-enable xdebug \

&& wget https://getcomposer.org/installer -O - -q | php -- --install-dir=/bin --filename=composer --quiet

RUN usermod -u ${USER_ID} www-data && groupmod -g ${GROUP_ID} www-data

WORKDIR /var/www/public
USER "${USER_ID}:${GROUP_ID}"
CMD ["php-fpm"]
