FROM nextcloud:stable-fpm

COPY www.conf /usr/local/etc/php-fpm.d/www.conf
COPY upload_tmp_dir.ini /usr/local/etc/php/conf.d/upload_tmp_dir.ini

EXPOSE 9000
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
