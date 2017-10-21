Alpine-docker-compose
===

Simple docker image based on alpine3.6 with docker client (`17.06.2-ce`) and docker-compose (`1.16.1`) installed.

- [**install docker client**](https://github.com/Cethy/alpine-docker-client)
- **install docker-compose**
    - install curl
    - fetch docker-compose binaries archive
    - unzip archive
    - move docker client binary
    - remove curl and cleanup artifacts

| **ENTRYPOINT** | **CMD** |
|:---:|:---:|
| `docker-compose` | `-v` |

## How to use (running docker-compose instructions)
Since this image is designed to work with the host docker engine, you need to pass the socket.

    # build
    docker run -it -v /var/run/docker.sock:/var/run/docker.sock cethy/alpine-docker-compose build

## Using another docker-compose version
Example building a new image with another docker-compose :

    docker build \
        --build-arg DOCKER_COMPOSE_VERSION="1.16.0" \
        -t my-alpine-docker-compose .
    docker run my-alpine-docker-compose
    # will output : docker-compose version 1.16.0, build ea60ca1

## Docker releases list
[https://download.docker.com/linux/static/stable/x86_64/](https://download.docker.com/linux/static/stable/x86_64/)

## Docker-compose releases list
[https://github.com/docker/compose/releases](https://github.com/docker/compose/releases)
