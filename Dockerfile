ARG VERSION=stable

FROM arm64v8/nextcloud:${VERSION}-apache

RUN apt-get update && apt-get install -y supervisor && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /var/log/supervisord /var/run/supervisord

COPY config/* /usr/src/nextcloud/config/
COPY php/conf.d/* /usr/local/etc/php/conf.d/
COPY supervisord.conf /etc/supervisor/supervisord.conf
RUN cp -f /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

ENV NEXTCLOUD_UPDATE=1

CMD ["/usr/bin/supervisord"]
