#!/bin/bash

set -e

if [ -z "$@" ]; then
  python3 /root/iridium-toolkit/reassembler.py -m acars -a json zmq: > /var/log/acars.log &
  python3 /root/iridium-toolkit/reassembler.py -m idapp > /var/log/idapp.log &
  exec iridium-extractor -D 4 -q 1000 /root/airspy.conf | python3 /root/iridium-toolkit/iridium-parser.py -o zmq
else
  exec $@
fi
