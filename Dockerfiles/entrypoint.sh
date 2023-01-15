#!/bin/bash

set -e

if [ -z "$@" ]; then
  python3 /root/iridium-toolkit/reassembler.py -m acars zmq: > /var/log/acars.log &
  python3 /root/iridium-toolkit/reassembler.py -m idapp zmq: > /var/log/idapp.log &
  iridium-extractor -D 4 /root/airspy.conf | python3 /root/iridium-toolkit/iridium-parser.py -o zmq
else
  exec $@
fi
