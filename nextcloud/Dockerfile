ARG VERSION=stable

FROM nextcloud:${VERSION}-apache

COPY config/* /usr/src/nextcloud/config/
COPY php/conf.d/* /usr/local/etc/php/conf.d/

ENV NEXTCLOUD_UPDATE=1
ENV PHP_MEMORY_LIMIT=1G
ENV PHP_UPLOAD_LIMIT=16G
ENV APACHE_BODY_LIMIT 0
