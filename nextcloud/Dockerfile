ARG VERSION=stable

FROM nextcloud:${VERSION}-apache

COPY config/* /usr/src/nextcloud/config/
COPY php/conf.d/* /usr/local/etc/php/conf.d/

ENV NEXTCLOUD_UPDATE=1
ENV PHP_MEMORY_LIMIT=1G
ENV PHP_UPLOAD_LIMIT=16G
ENV APACHE_BODY_LIMIT 0

RUN echo "export PHP_MEMORY_LIMIT=${PHP_MEMORY_LIMIT}" >> /etc/apache2/envvars
RUN echo "export PHP_UPLOAD_LIMIT=${PHP_UPLOAD_LIMIT}" >> /etc/apache2/envvars
RUN echo "export APACHE_BODY_LIMIT=${APACHE_BODY_LIMIT}" >> /etc/apache2/envvars

RUN apt-get update
RUN apt-get install monit cron dumb-init -y
RUN ln -s /etc/monit/conf-available/apache2 /etc/monit/conf-enabled/apache2
RUN ln -s /etc/monit/conf-available/cron /etc/monit/conf-enabled/cron
RUN rm /etc/cron.d/*
COPY cron.d/nextcloud /etc/cron.d/nextcloud
RUN rm /var/spool/cron/crontabs/www-data

ENTRYPOINT ["dumb-init", "--", "/entrypoint.sh"]
CMD ["monit", "-c", "/etc/monit/monitrc", "-I"]
