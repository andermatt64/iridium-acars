#!/bin/bash

set -e

if [ -z "$@" ]; then
  exec /usr/bin/supervisord -c /etc/supervisord.conf --nodaemon
else
  exec $@
fi
