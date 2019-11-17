#!/usr/bin/bash
set -e
# Functions
sig_int () {
  echo "SIGINT received"
  kill -2 ${pid}
}

sig_term () {
  echo "SIGTERM received"
  kill -15 ${pid}
}

/opt/teamspeak/ts3server_minimal_runscript.sh $@ &
pid=$!
trap sig_int  INT
trap sig_term TERM

wait $pid
