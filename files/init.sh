#!/bin/sh

[ -z "${BACKEND_ADDRESS}" ] && echo "ERROR: BACKEND_ADDRESS must be set." && exit 1;
[ -z "${BACKEND_PORT}" ] && echo "ERROR: BACKEND_PORT must be set." && exit 1;

echo "Using at most ${MEMORY_CACHE} of RAM for cache."
echo "Using backend http://${BACKEND_ADDRESS}:${BACKEND_PORT}."

# mkdir -p /var/lib/varnish/`hostname` && chown nobody /var/lib/varnish/`hostname`
varnishd -s malloc,${MEMORY_CACHE} -a :80 -T :6082 -b ${BACKEND_ADDRESS}:${BACKEND_PORT}
sleep 1
varnishlog
