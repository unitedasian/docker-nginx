FROM nginx:1.9

MAINTAINER Olivier Pichon <op@united-asian.com>

RUN usermod -u 1000 www-data

COPY entrypoint.d /entrypoint.d

COPY vhost.conf /etc/nginx/conf.d/default.conf

VOLUME /var/symfony

RUN chown -R www-data:www-data /var/symfony && \
	chmod -R +s /var/symfony && \
	umask 0002

WORKDIR /var/symfony

CMD ["/entrypoint.sh"]
