#!/bin/sh
export TERM=xterm
set -u
# Bash Colors
green=`tput setaf 2`
bold=`tput bold`
reset=`tput sgr0`
TS3_DATABASE="/opt/teamspeak/ts3server.sqlitedb"
# Functions
log() {
  if [[ "$@" ]]; then echo "${bold}${green}[LOG `date +'%T'`]${reset} $@";
  else echo; fi
}
start_ts3() {
  log "Starting Teamspeak 3 Server"
  /opt/teamspeak/ts3server_minimal_runscript.sh
}

install_ts3() {
  log "Downloading Teamspeak version: ${TS3_VERSION}"
  wget http://dl.4players.de/ts/releases/${TS3_VERSION}/teamspeak3-server_linux_amd64-${TS3_VERSION}.tar.bz2 -O /tmp/teamspeak.tar.bz2
  mkdir -p opt/teamspeak
  tar jxf /tmp/teamspeak.tar.bz2 -C /opt/teamspeak --strip-components=1
  rm -f /tmp/teamspeak.tar.bz2
  log "Teamspeak version: ${TS3_VERSION} installed."
}

if [[ ! -e ${TS3_DATABASE} ]]; then
  install_ts3
fi
start_ts3
