ARG VERSION=stable

FROM arm64v8/nextcloud:${VERSION}-apache

RUN sed -i -e's/ main/ main contrib non-free/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y supervisor && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /var/log/supervisord /var/run/supervisord

COPY config/* /usr/src/nextcloud/config/
COPY php/conf.d/* /usr/local/etc/php/conf.d/
COPY supervisord.conf /etc/supervisor/supervisord.conf
RUN cp -f /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN echo "ReadBufferSize 1024000" >> /etc/apache2/apache2.conf
#RUN echo "BufferSize 1048576" >> /etc/apache2/apache2.conf
#RUN ln -s ../mods-available/buffer.load /etc/apache2/mods-enabled/buffer.load
#COPY docker-php.conf /etc/apache2/conf-avilable/docker-php.conf
#COPY mpm_prefork.conf /etc/apache2/mods-available/mpm_prefork.conf

ENV NEXTCLOUD_UPDATE=1
ENV PHP_MEMORY_LIMIT=1G
ENV PHP_UPLOAD_LIMIT=16G

CMD ["/usr/bin/supervisord"]
