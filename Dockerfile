FROM --platform=linux/arm64 docker.io/alpine:latest

RUN apk add gcc gcompat && apk cache clean

WORKDIR /opt

RUN wget https://github.com/mbrubeck/agate/releases/download/v3.3.14/agate.aarch64-unknown-linux-gnu.gz && \
    gunzip agate.aarch64-unknown-linux-gnu.gz && \
    mv agate.aarch64-unknown-linux-gnu /usr/bin/agate && \
    chmod +x /usr/bin/agate

WORKDIR /

EXPOSE 1965

VOLUME /gemified.space/
VOLUME /certs/

ENTRYPOINT ["/usr/bin/agate", "--addr", "0.0.0.0:1965", "--content", "/gemified.space/", "--certs", "/certs/", "--hostname", "gemified.space"]
