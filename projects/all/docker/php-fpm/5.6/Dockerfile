FROM php:5.6-fpm

ARG USER_ID
ARG GROUP_ID

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    iputils-ping \

    g++ \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libwebp-dev \
    libxpm-dev \
    libjpeg-dev \
    zlib1g-dev \
    libicu-dev \
    libmagickwand-dev --no-install-recommends libxml2-dev \

&& docker-php-ext-install opcache \
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl \
&& docker-php-ext-install mbstring zip xml mcrypt pdo_mysql mysqli \
&& pecl install imagick \
&& docker-php-ext-enable imagick \
&& pecl install xdebug-2.5.5 \
&& docker-php-ext-enable xdebug \

&& docker-php-ext-configure gd \
    --with-gd \
    --with-webp-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib-dir \
    --with-xpm-dir \
    --with-freetype-dir \
    --enable-gd-native-ttf \
&& docker-php-ext-install gd \
&& docker-php-ext-enable gd \

&& wget https://getcomposer.org/installer -O - -q | php -- --install-dir=/bin --filename=composer --quiet \
&& usermod -u ${USER_ID} www-data && groupmod -g ${GROUP_ID} www-data


WORKDIR /var/www/public
USER "${USER_ID}:${GROUP_ID}"
CMD ["php-fpm"]
