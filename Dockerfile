FROM alpine:3.6

ARG VERSION=5.1.3-r0
ENV MEMORY_CACHE "100M"
ENV BACKEND_ADDRESS ""
ENV BACKEND_PORT ""

RUN set -xe \
    && apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
        "musl-dev=1.1.16-r20" \
        "varnish=${VERSION}"

COPY files/init.sh /init.sh

EXPOSE 80

CMD ["/bin/sh", "/init.sh"]