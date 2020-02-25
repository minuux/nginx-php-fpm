FROM richarvey/nginx-php-fpm:latest

ENV timezone Asia/Shanghai
RUN apk add autoconf gcc libc-dev make tzdata && \
    pecl install mongodb && \
    docker-php-ext-enable mongodb &&\
    cp /usr/share/zoneinfo/${timezone} /etc/localtime && \
    echo ${timezone} > /etc/timezone
