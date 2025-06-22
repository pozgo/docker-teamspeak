FROM debian:12

ENV  \
    TS3_VERSION=3.13.7 \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN \
    apt update && \
    apt install -y wget bzip2 libc6 && \
    wget http://files.teamspeak-services.com/releases/server/${TS3_VERSION}/teamspeak3-server_linux_amd64-${TS3_VERSION}.tar.bz2 -O /tmp/teamspeak.tar.bz2 && \
    mkdir -p /opt/teamspeak && \
    touch /opt/teamspeak/.ts3server_license_accepted && \
    tar jxf /tmp/teamspeak.tar.bz2 -C /opt/teamspeak --strip-components=1 && \
    rm -f /tmp/teamspeak.tar.bz2

COPY container-files /

#ENTRYPOINT ["/bootstrap.sh"]

EXPOSE 9987/udp 10011 10080 30033