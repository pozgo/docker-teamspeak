### Alpine requires glibc to be present in the system below link to fficial repository
### https://github.com/sgerrand/alpine-pkg-glibc
FROM centos:7

ENV     TS3_VERSION=3.8.0

RUN \
    yum install -y wget bzip2 glibc && \
    wget http://dl.4players.de/ts/releases/${TS3_VERSION}/teamspeak3-server_linux_amd64-${TS3_VERSION}.tar.bz2 -O /tmp/teamspeak.tar.bz2 && \
    mkdir -p /opt/teamspeak && \
    touch /opt/teamspeak/.ts3server_license_accepted && \
    tar jxf /tmp/teamspeak.tar.bz2 -C /opt/teamspeak --strip-components=1 && \
    rm -f /tmp/teamspeak.tar.bz2 && \
    yum clean all

COPY container-files /

ENTRYPOINT ["/bootstrap.sh"]

EXPOSE 9987/udp 10011 30033
