FROM richarvey/nginx-php-fpm:latest

ENV timezone Asia/Shanghai
RUN apk add autoconf gcc libc-dev make && \
    pecl install mongodb && \
    docker-php-ext-enable mongodb \
    tzdata && \
    cp /usr/share/zoneinfo/${timezone} /etc/localtime && \
    echo ${timezone} > /etc/timezone
