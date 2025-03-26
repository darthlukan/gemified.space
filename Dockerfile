FROM --platform=linux/arm64 docker.io/rust:latest

RUN cargo install agate

EXPOSE 1965

VOLUME /gemified.space/
VOLUME /certs/

ENTRYPOINT ["agate", "--addr", "0.0.0.0:1965", "--content", "/gemified.space/", "--certs", "/certs/", "--hostname", "gemified.space"]
