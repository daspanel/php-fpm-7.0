FROM daspanel/alpine-base-edge
MAINTAINER Abner G Jacobsen - http://daspanel.com <admin@daspanel.com>

ENV TZ="UTC"

# Stop container initialization if error occurs in cont-init.d fix-attrs.d script's
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

LABEL php_version="7.0" architecture="amd64"

ARG PHP_MODULES="php7-ctype php7-curl php7-dom php7-gd php7-iconv php7-intl \
    php7-json php7-mcrypt php7-mysqli php7-openssl \
    php7-pdo php7-pdo_mysql php7-pdo_pgsql php7-pdo_sqlite php7-pear \
    php7-pgsql php7-phar php7-sqlite3 php7-xml php7-zip php7-zlib \
    php7-pcntl php7-ftp php7-gettext php7-imap php7-session php7-mbstring"

RUN apk update && \
    apk --update --no-cache add --virtual build_deps curl && \
    apk add --no-cache --update php7-fpm php7 $PHP_MODULES && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    ln -s /usr/sbin/php-fpm7 /usr/bin/php-fpm && \
    ln -s /usr/lib/php7 /usr/lib/php && \
    curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/bin --filename=composer && \
    apk del build_deps && \
    rm -rf \
        /var/cache/apk/* \
        /usr/local/* \
        /tmp/src \
        /tmp/*

# Inject files in container file system
COPY rootfs /

# Expose ports for the service
EXPOSE 9000

