FROM cethy/alpine-docker-client:v1.0 as docker-client

# final stage
# glibc is needed for docker-compose
FROM frolvlad/alpine-glibc:alpine-3.6

# get docker client binary
COPY --from=docker-client /usr/local/bin/docker /bin/docker

ARG DOCKER_COMPOSE_VERSION="1.16.1"
ENV DOWNLOAD_URL="https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-Linux-x86_64"

# install docker-compose
RUN apk add --update --virtual build_deps curl \
    && curl -L $DOWNLOAD_URL > /bin/docker-compose \
    && chmod +x /bin/docker-compose \
    && apk del build_deps \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["docker-compose"]
CMD ["-v"]
