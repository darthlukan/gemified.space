FROM --platform=linux/arm64 docker.io/alpine:latest

COPY bin/agate /usr/bin/agate
RUN apk add gcc gcompat && apk cache clean

EXPOSE 1965

VOLUME /gemified.space/
VOLUME /certs/

ENTRYPOINT ["/usr/bin/agate", "--addr", "0.0.0.0:1965", "--content", "/gemified.space/", "--certs", "/certs/", "--hostname", "gemified.space"]
