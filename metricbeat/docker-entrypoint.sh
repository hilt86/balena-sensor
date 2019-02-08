#!/bin/sh

set -e

if [ -n "${CLOUD_ID+x}" ] && [ -n "${CLOUD_AUTH+x}" ]; then
sed -i -e "s/^#cloud.id:.*/cloud.id: ${CLOUD_ID}/" -e "s/^#cloud.auth:.*/cloud.auth: ${CLOUD_AUTH}/" /etc/metricbeat/metricbeat.yml
fi

# enable promiscuous mode
/sbin/ip link set eth0 promisc on

exec /usr/bin/metricbeat -e -c /etc/metricbeat/metricbeat.yml
