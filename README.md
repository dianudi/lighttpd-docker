# Lighttpd Docker Reverse Proxy

Make Lighttpd a reverse proxy for connecting to each web server on many Docker containers. SSL uses a self-signed certificate and is auto-generated at once.
Main branch is for Reverse proxy, for other variant see branch menu.

### Build

1. Clone or download this repository.
2. Configure your web service in the etc/service-enabled directory as you want.
3. Build with docker compose

```sh
docker compose up -d --build
```

4. Check the container .

```sh
docker compose ps
```

### Self-Signed Certificate Configuration

You can customize the self-signed certificate by passing build arguments during the Docker image build process.

Example of building with custom certificate details:

```sh
docker build \
  --build-arg COUNTRY="US" \
  --build-arg STATE="California" \
  --build-arg LOCALITY="San Francisco" \
  --build-arg ORGANIZATION="MyCompany" \
  --build-arg COMMON_NAME="example.com" \
  -t lighttpd-docker .
```

Or, if using `docker compose`, you can specify build arguments in your `docker-compose.yml` file:

```yaml
version: "3.8"
services:
  lighttpd:
    build:
      context: .
      args:
        COUNTRY: "US"
        STATE: "California"
        LOCALITY: "San Francisco"
        ORGANIZATION: "MyCompany"
        COMMON_NAME: "example.com"
    ports:
      - "80:80"
      - "443:443"
```

Remember to rebuild your Docker image after changing these arguments.

### Contribution

You are free to contribute to this repository.
If you find an issue, you can open an issue at this repository.
