#!/bin/sh

chown -R www-data:www-data /var/symfony
chmod -R 777 /var/symfony/app/cache
chmod -R 777 /var/symfony/app/logs
chmod -R +s /var/symfony
umask 0002
