FROM varnish:stable

ENV MEMORY_CACHE="100M" \
    BACKEND_ADDRESS="" \
    BACKEND_PORT=""

COPY files/init.sh /init.sh

EXPOSE 80

CMD ["/bin/sh", "/init.sh"]
