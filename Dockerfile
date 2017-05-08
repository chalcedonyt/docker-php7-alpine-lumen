FROM php:7.1-fpm-alpine
MAINTAINER timothy.teoh@frogasia.com

RUN sed -i -e 's/v3\.4/v3.5/g' /etc/apk/repositories
RUN apk --no-cache add \
curl \
git \
libmcrypt-dev \
libmcrypt \
mysql-client \
wget \
#Xdebug
autoconf \
gcc \
g++ \
make

RUN docker-php-ext-install \
mcrypt \
mbstring \
mysqli \
pdo_mysql

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

EXPOSE 9000
CMD ["php-fpm", "-F"]


