# DNSCrypt-proxy docker image

This is a unofficial docker image build for dnscrypt-proxy

## Tags list
  - `2.0.17-ubuntu`, `2.0-ubuntu`, `ubuntu`, `latest` [(dnscrypt-proxy/ubuntu.Dockerfile)](./ubuntu.Dockerfile)
  - `2.0.17-debian`, `2.0-debian`, `debian` [(dnscrypt-proxy/debian.Dockerfile)](./debian.Dockerfile)
  - `2.0.17-debian-slim`, `2.0-debian-slim`, `debian-slim` [(dnscrypt-proxy/debian-slim.Dockerfile)](./debian-slim.Dockerfile)
  - `2.0.17-alpine`, `2.0-alpine`, `alpine` [(dnscrypt-proxy/alpine.Dockerfile)](./alpine.Dockerfile)

## Background
This docker image is unofficial build for [dnscrypt-proxy](https://github.com/jedisct1/dnscrypt-proxy). The author has their own official build [here](https://hub.docker.com/r/jedisct1/dnscrypt-server/), but this image is built with unbound included.

## Running the container
This dnscrypt-proxy is using port 53 (TCP/UDP) by default, so using `docker run -p 53:53 ardhinata/dnscrypt-proxy` should be sufficient for running it standalone with default config.

## Configuration
You can pull default config in tar files using `docker run --rm ardhinata/dnscrypt tar -cOC /etc dnscrypt-proxy > dnscrypt-proxy.tar`, extract and change it according to your requirements.

To run dnscrypt-proxy with your config, simply use `docker run -p 53:53 -v $PWD/dnscrypt-proxy/dnscrypt-proxy.toml:/etc/dnscrypt-proxy/dnscrypt-proxy.toml:ro ardhinata/dnscrypt-proxy`, or mount all config directory with `docker run -p 53:53 -v $PWD/dnscrypt-proxy:/etc/dnscrypt-proxy:ro ardhinata/dnscrypt-proxy`.


## Environment Variables
Environment variables for this image is currently unavailable. If you need to change certain configuration, just use method explained in [configuration](#Configuration) section above.

## License
View [License Information](https://github.com/jedisct1/dnscrypt-proxy/blob/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
