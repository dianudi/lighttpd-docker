# Lighttpd Docker Reverse Proxy

Make Lighttpd as an PHP web server. SSL uses a self-signed certificate and is auto-generated at once.
This branch is for PHP, for other variant see branch menu.

### Build

1. Clone or download this repository.
2. Configure your vhost in the etc/vhost-enabled directory as you want.
3. Build with docker compose

```sh
docker compose up -d --build
```

4. Check the container .

```sh
docker compose ps
```

### Contribution

You are free to contribute to this repository.
If you find an issue, you can open an issue at this repository.
