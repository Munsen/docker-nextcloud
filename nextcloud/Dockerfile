FROM nextcloud:stable-fpm

COPY www.conf /usr/local/etc/php-fpm.d/www.conf

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
