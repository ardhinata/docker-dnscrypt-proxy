## Dockerfile to generate dnscrypt-proxy on alpine container
## Created by ardhinata.juari@gmail.com

# Build dnscrypt-proxy using golang container
FROM  golang:1.10.4-alpine
ENV GIT_TAG="2.0.17"
RUN set -ex;\
  apk --no-cache add git util-linux;\
  git clone https://github.com/jedisct1/dnscrypt-proxy.git source; cd source;\
  git checkout $GIT_TAG;\
  export GOPATH=$PWD;\
  cd dnscrypt-proxy;\
  go get -v -d;\
  go clean;\
  go build -v -ldflags="-s -w -v" -o $GOPATH/linux-amd64/dnscrypt-proxy;\
  mkdir $GOPATH/linux-amd64/example;\
  sed -i "s/\,\ '\[::1\]:53'//g" example-dnscrypt-proxy.toml;\
  cp $GOPATH/dnscrypt-proxy/example-* $GOPATH/linux-amd64/example/;\
  cd $GOPATH/linux-amd64/example;\
  rename --verbose "example-" "" example*;

# Final container using alpine:latest
FROM  alpine:latest
WORKDIR /app/dnscrypt-proxy
# Copy compiled binary to this container
COPY  --from=0 /go/source/linux-amd64 .
RUN set -ex;\
  apk --no-cache add ca-certificates;\
  mkdir -p /etc/dnscrypt-proxy;\
  cp ./example/* /etc/dnscrypt-proxy/;\
  cd /etc/dnscrypt-proxy;
EXPOSE 53/tcp
EXPOSE 53/udp
CMD	["./dnscrypt-proxy", "-config", "/etc/dnscrypt-proxy/dnscrypt-proxy.toml"]
