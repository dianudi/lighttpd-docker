FROM alpine

RUN apk add --update --no-cache lighttpd\
# You can add more php extension for your application.
 php83-fpm \
#  php83-ctype \
#  php83-curl \
#  php83-dom \
#  php83-fileinfo \
#  php83-gd \
#  php83-intl \
#  php83-mbstring \
#  php83-mysqli \
#  php83-opcache \
#  php83-openssl \
#  php83-phar \
#  php83-session \
#  php83-tokenizer \
#  php83-xml \
#  php83-xmlreader \
#  php83-xmlwriter \
 openssl && rm -rf /var/cache/apk/*

# ensure www-data user exists
RUN set -eux; \
	adduser -u 82 -D -S -G www-data www-data
    
# Copy configuration.
COPY etc/lighttpd /etc/lighttpd
COPY start.sh /usr/local/bin/

# Expose HTTP(S) Port.
EXPOSE 80
EXPOSE 443

# Create cache dir.
RUN mkdir /var/cache/lighttpd
RUN mkdir /var/cache/lighttpd/compress

# Generate self signed certificate for 1 years. (example below is for indonesian country)
RUN openssl req -x509 -newkey rsa:4096 -keyout /etc/lighttpd/certs/key.pem -out /etc/lighttpd/certs/cert.pem -sha256 -days 365 -nodes -subj "/C=ID/ST=DKI Jakarta/L=Jakarta/O=None/OU=None/CN=*"

# Remove openssl
# RUN apk del --purge openssl

VOLUME [ "/var/www" ]

# Run Webserver
CMD [ "start.sh" ]