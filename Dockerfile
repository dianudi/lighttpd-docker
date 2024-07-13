FROM alpine

# You can add more php extension for your application.
RUN apk add --update --no-cache lighttpd php83-fpm openssl && rm -rf /var/cache/apk/*

# Copy configuration.
COPY etc/lighttpd /etc/lighttpd/
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
RUN apk del --purge openssl

VOLUME [ "/var/www" ]

# Run Webserver
CMD [ "start.sh" ]