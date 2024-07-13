#!/bin/sh

# chmod a+w /dev/pts/0
php-fpm83 -D
exec lighttpd -D -f /etc/lighttpd/lighttpd.conf