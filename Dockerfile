# start from php image: 7.4-fpm
# reference: https://hub.docker.com/_/php
FROM php:7.4-fpm
MAINTAINER guicsmts

# Install packages to runing laravel
RUN apt-get update && apt-get install -y \
    libwebp-dev \ 
    libjpeg62-turbo-dev \
    libpng-dev \
    libxpm-dev \
    libfreetype6-dev \
    default-mysql-client \
    nginx \
    ntp \
    iputils-ping \
    net-tools \
    vim \
    zip \ 
    unzip \
    curl \
    git \
    python3 \
    python3-dev \     
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
# add user to /home/
#RUN useradd laravel
WORKDIR /root/
# clone repository laravel
# https://github.com/laravel/laravel
RUN git clone https://github.com/laravel/laravel
RUN mv laravel local.mylaravel.com
# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# configuring nginx
RUN rm -rf /etc/nginx/sites-available/default
RUN rm -rf /etc/nginx/sites-enabled/default
# create a new sites file
COPY ./config/nginx/local.mylaravel.com /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/local.mylaravel.com /etc/nginx/sites-enabled/
# configuring basic php.ini

# permissions directory www-data
RUN chown -R www-data:www-data /root/local.mylaravel.com/
RUN chmod 0755 /root/local.mylaravel.com/storage/logs/
# deploy laravel
WORKDIR /root/local.mylaravel.com/
RUN mv .env.example .env
RUN composer install
RUN php artisan key:generate
RUN php artisan config:cache
# expose port
EXPOSE 9000
EXPOSE 80




