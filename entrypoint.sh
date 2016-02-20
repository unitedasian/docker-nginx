#!/bin/sh

#for f in /entrypoint.d/*.sh; do
#    . $f
#done

exec supervisord -c /etc/supervisord.conf