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
    default-mysql-server \
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
#useradd laravel
RUN useradd -m laravel
WORKDIR /home/laravel/
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
COPY ./config/php-fpm/php.ini /usr/local/etc/php/
# permissions directory www-data
RUN chown -R www-data:www-data /home/laravel/local.mylaravel.com/
RUN chmod -R 755 /home/laravel/local.mylaravel.com/storage/
# deploy laravel
WORKDIR /home/laravel/local.mylaravel.com/
RUN mv .env.example .env
RUN composer install
RUN php artisan key:generate
RUN php artisan config:cache
RUN php artisan config:clear
# expose port
EXPOSE 9000
EXPOSE 80

# command start
WORKDIR /home/laravel/local.mylaravel.com/public
CMD ["php-fpm", "index.php"]




