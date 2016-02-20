FROM alpine:3.3

MAINTAINER Olivier Pichon <op@united-asian.com>

RUN apk add --update \
		curl \
		nginx \
		supervisor

COPY supervisor.d/nginx.ini /etc/supervisor.d/nginx.ini

COPY entrypoint.sh /entrypoint.sh

COPY entrypoint.d /entrypoint.d

COPY nginx/nginx.conf /etc/nginx/nginx.conf

COPY nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

ONBUILD COPY entrypoint.d /entrypoint.d

ONBUILD COPY nginx/nginx.conf /etc/nginx/nginx.conf

ONBUILD COPY nginx/conf.d /etc/nginx/conf.d

ONBUILD COPY . /usr/share/nginx/html

ENTRYPOINT "/entrypoint.sh"
